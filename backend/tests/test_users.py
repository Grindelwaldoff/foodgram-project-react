from http import HTTPStatus

import pytest

from tests.utils import (
    check_pagination,
    invalid_data_for_set_password,
    invalid_data_for_username_and_email_fields,
    invalid_data_for_user_creation
)


@pytest.mark.django_db(transaction=True)
class TestUserRegistarion:
    url_signup = '/api/users/'
    url_token = '/api/token/'

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
        empty_fields = ['username', 'email', 'first_name', 'second_name', 'password']
        for field in empty_fields:
            assert (field in response_json
                    and isinstance(response_json.get(field), list)), (
                        f'Если в POST-запросе к `{self.url_signup}` не '
                'переданы необходимые данные, в ответе должна возвращаться '
                'информация об обязательных для заполнения полях.'
            )

    def test_invalid_data_signup():
        pass
