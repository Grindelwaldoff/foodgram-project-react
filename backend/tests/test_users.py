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
    url_signup = '/api/users/'
    url_token = '/api/token/'
    url_set_password = '/api/users/set_password/'

    def test_nodata_signup(self, client):
        response = client.post(self.url_signup)

        assert response.status_code != HTTPStatus.NOT_FOUND, (
            f'Эндпоинт `{self.url_signup}` не найден. Проверьте настройки '
            'в *urls.py*.'
        )
        assert response.status_code == HTTPStatus.BAD_REQUEST, (
            f'Если POST-запрос, отправленный на эндпоинт `{self.url_signup}`, '
            'не содержит необходимых данных, должен вернуться ответ со '
            'статусом 400.'
        )
        response_json = response.json()
        empty_fields = [
            'username', 'email', 'first_name',
            'second_name', 'password'
        ]
        for field in empty_fields:
            assert (field in response_json
                    and isinstance(response_json.get(field), list)), (
                        f'Если в POST-запросе к `{self.url_signup}` не '
                'переданы необходимые данные, в ответе должна возвращаться '
                'информация об обязательных для заполнения полях.'
            )

    def test_invalid_data_signup(self, client):
        for test in invalid_data_for_user_fields:
            print(test)
            data, assertion = test
            response = client.post(self.url_signup, data=data)
            assert response.status_code != HTTPStatus.NOT_FOUND, (
                f'Эндпоинт `{self.url_signup}` не найден. '
                'Проверьте настройки в *urls.py*.'
            )
            assert response.status_code != HTTPStatus.CREATED, (
                assertion
            )

    def test_set_password_check(self, admin_client):
        data = {
            'new_password': 123123,
            'current_password': 1111
        }
        response = admin_client.post(self.url_set_password, data=data)
        assert response.status_code != HTTPStatus.NOT_FOUND, (
            f'Эндпоинт `{self.url_set_password}` не найден. '
            'Проверьте настройки в *urls.py*.'
        )
        assert response.status_code != HTTPStatus.OK, (
            f'Эндпоинт `{self.url_set_password}` не позволяет '
            f'изменить пароль. {response.status_code}'
        )
        # assert user.password == data['new_password'], (
        #     'Пароль не возможно изменить!'
        # )

    def test_set_password_with_invalid_data(self, admin_client):
        for test in invalid_data_for_set_password:
            data, assertion = test
            response = admin_client.post(self.url_set_password, data=data)
            assert response.status_code != HTTPStatus.NO_CONTENT, (
                assertion
            )
