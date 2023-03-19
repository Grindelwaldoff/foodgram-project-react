from http import HTTPStatus

import pytest

from tests.utils import (
    # check_pagination,
    invalid_data_for_set_password,
    invalid_data_for_user_fields,
    # invalid_data_for_user_creation
)


@pytest.mark.django_db(transaction=True)
class TestUserRegistarion:
    url_signup = "/api/users/"
    url_token = "/api/auth/token/login/"
    url_token_logout = "/api/auth/token/logout/"
    url_set_password = "/api/users/set_password/"

    def test_nodata_signup(self, client):
        response = client.post(self.url_signup)

        assert response.status_code != HTTPStatus.NOT_FOUND, (
            f"Эндпоинт `{self.url_signup}` не найден. Проверьте настройки "
            "в *urls.py*."
        )
        assert response.status_code == HTTPStatus.BAD_REQUEST, (
            f"Если POST-запрос, отправленный на эндпоинт `{self.url_signup}`, "
            "не содержит необходимых данных, должен вернуться ответ со "
            "статусом 400."
        )
        response_json = response.json()
        empty_fields = [
            "username", "email", "first_name",
            "second_name", "password"
        ]
        for field in empty_fields:
            assert (field in response_json
                    and isinstance(response_json.get(field), list)), (
                        f"Если в POST-запросе к `{self.url_signup}` не "
                "переданы необходимые данные, в ответе должна возвращаться "
                "информация об обязательных для заполнения полях."
            )

    def test_invalid_data_signup(self, client):
        for test in invalid_data_for_user_fields:
            print(test)
            data, assertion = test
            response = client.post(self.url_signup, data=data)
            assert response.status_code != HTTPStatus.NOT_FOUND, (
                f"Эндпоинт `{self.url_signup}` не найден. "
                "Проверьте настройки в *urls.py*."
            )
            assert response.status_code != HTTPStatus.CREATED, (
                assertion
            )

    def test_set_password_check(self, admin_client):
        data = {
            "new_password": 123123,
            "current_password": 1111
        }
        response = admin_client.post(self.url_set_password, data=data)
        assert response.status_code != HTTPStatus.NOT_FOUND, (
            f"Эндпоинт `{self.url_set_password}` не найден. "
            "Проверьте настройки в *urls.py*."
        )
        assert response.status_code != HTTPStatus.OK, (
            f"Эндпоинт `{self.url_set_password}` не позволяет "
            f"изменить пароль. {response.status_code}"
        )

    def test_set_password_with_invalid_data(self, admin_client):
        for test in invalid_data_for_set_password:
            data, assertion = test
            response = admin_client.post(self.url_set_password, data=data)
            assert response.status_code != HTTPStatus.NO_CONTENT, (
                assertion
            )

    def test_token_access(self, client):
        response = client.post(self.url_token_logout)
        assert response.status_code != HTTPStatus.NOT_FOUND, (
            f"Эндпоинт `{self.url_token_logout}` не найдена. "
            "Проверьте настройки в *urls.py*."
        )

        response = client.post(self.url_token)
        assert response.status_code != HTTPStatus.NOT_FOUND, (
            f"Эндпоинт `{self.url_token}` не найдена. Проверьте настройки в "
            "*urls.py*."
        )

        assert response.status_code == HTTPStatus.BAD_REQUEST, (
            "Проверьте, что POST-запрос без данных, отправленный на эндпоинт "
            f"`{self.url_token}`, возвращает ответ со статусом 400."
        )

        invalid_data = {
            "confirmation_code": 12345
        }
        response = client.post(self.url_token, data=invalid_data)
        assert response.status_code == HTTPStatus.BAD_REQUEST, (
            "Проверьте, что POST-запрос, отправленный на эндпоинт "
            f"`{self.url_token}`и не содержащий информации о `username`, "
            "возвращает ответ со статусом 400."
        )
        invalid_data = {
            "username": "unexisting_user",
            "confirmation_code": 12345
        }
        response = client.post(self.url_token, data=invalid_data)
        assert response.status_code == HTTPStatus.BAD_REQUEST, (
            "Проверьте, что POST-запрос с `username`, "
            f"отправленный на эндпоинт `{self.url_token}`, возвращает ответ "
            "со статусом 404."
        )
        invalid_data = {
            "email": "valid@yamdb.fake",
            "confirmation_code": 12345
        }
        response = client.post(self.url_token, data=invalid_data)
        assert response.status_code == HTTPStatus.BAD_REQUEST, (
            "Проверьте, что POST-запрос с корректным `email` и невалидным "
            f"`confirmation_code`, отправленный на эндпоинт `{self.url_token}`"
            ", возвращает ответ со статусом 400."
        )

    def test_signup(self, client, django_user_model):
        user_cnt = django_user_model.objects.count()
        valid_data = {
            "username": "validus",
            "email": "vlida2@yamdb.fake",
            "password": 1111,
            "first_name": "Vse",
            "second_name": "ryb"
        }
        response = client.post(self.url_signup, data=valid_data)
        assert response.status_code != HTTPStatus.NOT_FOUND, (
            f"Эндпоинт `{self.url_signup}` не найден. Проверьте настройки "
            "в *urls.py*."
        )
        assert response.status_code == HTTPStatus.CREATED, (
            "POST-запрос с корректными данными, отправленный на эндпоинт "
            f"`{self.url_signup}`, должен вернуть ответ со статусом 200."
        )
        assert 'id' in response.json(), (
            "POST-запрос с корректными данными, отправленный на эндпоинт "
            f"`{self.url_signup}`, должен вернуть ответ, содержащий "
            "информацию о `username` и `email` созданного пользователя."
        )
        assert django_user_model.objects.count() == (user_cnt + 1), (
            "POST-запрос с корректными данными, отправленный на эндпоинт "
            f"`{self.url_signup}`, должен создать нового пользователя."
        )


@pytest.mark.django_db(transaction=True)
class TestUserFunc:
    url_me = '/api/users/me/'
    url_profile = '/api/users/'

    def test_base_urls_accessible(self, client):
        response = client.get(self.url_me)
        assert response.status_code != HTTPStatus.NOT_FOUND, (
            f"Эндпоинт `{self.url_me}` не найден. Проверьте настройки "
            "в *urls.py*."
        )
        response = client.get(self.url_profile)
        assert response.status_code != HTTPStatus.NOT_FOUND, (
            f"Эндпоинт `{self.url_profile}` не найден. Проверьте настройки "
            "в *urls.py*."
        )
