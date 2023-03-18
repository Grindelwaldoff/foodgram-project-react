from http import HTTPStatus

check_tag_fields_patterns = (
    (
        {
            'name': 'a' * 256 + 'simbols',
            'color': '#49B64E',
            'slug': 'longname'
        },
        ((
            'Проверьте, что при обработке POST-запроса к `{url}` проверяется '
            'длина поля `name`: название произведения не '
            'должно быть длиннее 256 символов.'
        ),)
    ),
    (
        {
            'name': 'longslug',
            'color': '#49B64E',
            'slug': 'l' * 50 + 'simbols'
        },
        ((
            'Проверьте, что при обработке POST-запроса к `{url}` проверяется '
            'длина поля `slug`: его содержимое не должно быть длиннее 50 '
            'символов.'
        ),)
    ),
    (
        {
            'name': 'brokenslug',
            'color': '#49B64E',
            'slug': ':-)'
        },
        ((
            'Проверьте, что при обработке POST-запроса к `{url}` содержание '
            'поля `slug` проверяется на соответствие паттерну, указанному в '
            'спецификации: ^[-a-zA-Z0-9_]+$'
        ),)
    )
)
invalid_data_for_user_fields = [
    (
        {
            'first_name': 'testname',
            'second_name': 'testsurnmae',
            'password': 1111,
            'email': ('a' * 244) + '@yamdb.fake',
            'username': 'valid-username'
        },
        ((
            'Проверьте, что при обработке {request_method}-запроса к `{url}` '
            'проверяется длина поля `email`: его содержимое не должно быть '
            'длиннее 254 символа.'
        ),)
    ),
    (
        {
            'first_name': 'testname',
            'second_name': ('a' * 151),
            'password': 1111,
            'email': 'valid-email@yamdb.fake',
            'username': 'asdfw'
        },
        ((
            'Проверьте, что при обработке {request_method}-запроса к `{url}` '
            'проверяется длина поля `second_name`: его содержимое не должно '
            'быть длиннее 150 символов.'
        ),)
    ),
    (
        {
            'first_name': ('a' * 151),
            'second_name': 'testsurnmae',
            'password': 1111,
            'email': 'valid-email@yamdb.fake',
            'username': 'asdafasf'
        },
        ((
            'Проверьте, что при обработке {request_method}-запроса к `{url}` '
            'проверяется длина поля `first_name`: его содержимое не должно '
            'быть длиннее 150 символов.'
        ),)
    ),
    (
        {
            'first_name': 'testname',
            'second_name': 'testsurnmae',
            'password': 1111,
            'email': 'valid-email@yamdb.fake',
            'username': ('a' * 151)
        },
        ((
            'Проверьте, что при обработке {request_method}-запроса к `{url}` '
            'проверяется длина поля `username`: его содержимое не должно быть '
            'длиннее 150 символов.'
        ),)
    ),
    (
        {
            'email': 'valid-email@yamdb.fake',
            'username': '|-|aTa|_|_|a',
            'first_name': 'testname',
            'second_name': 'testsurnmae',
            'password': 1111,
        },
        ((
            'Проверьте, что при обработке {request_method}-запроса к `{url}` '
            'содержание поля `username` проверяется на соответствие '
            'паттерну, указанному в спецификации: ^[\\w.@+-]+\\z'
        ),)
    )
]
invalid_data_for_user_creation = (
    invalid_data_for_user_fields.copy()
)
invalid_data_for_set_password = (
    (
        {
            'new_password': 123123,
            'current_password': ''
        },
        ((
            'Проверьте, что при обработке {request_method}-запроса к `{url}` '
            'содержание поля `current_password` проверяется на наличие'
        ),)
    ),
    (
        {
            'new_password': 123123,
            'current_password': 2222
        },
        ((
            'Проверьте, что при обработке {request_method}-запроса к `{url}` '
            'содержание поля `current_password` проверяется на соответствие '
            'настоящему паролю пользователя.'
        ),)
    ),
)


def check_pagination(url, respons_data, expected_count, post_data=None):
    expected_keys = ('count', 'next', 'previous', 'results')
    for key in expected_keys:
        assert key in respons_data, (
            f'Проверьте, что для эндпоинта `{url}` настроена '
            f'пагинация и ответ на GET-запрос содержит ключ {key}.'
        )
    assert respons_data['count'] == expected_count, (
        f'Проверьте, что для эндпоинта `{url}` настроена '
        f'пагинация. Сейчас ключ `count` содержит некорректное значение.'
    )
    assert isinstance(respons_data['results'], list), (
        f'Проверьте, что для эндпоинта `{url}` настроена '
        'пагинация. Значением ключа `results` должен быть список.'
    )
    assert len(respons_data['results']) == expected_count, (
        f'Проверьте, что для эндпоинта `{url}` настроена пагинация. Сейчас '
        'ключ `results` содержит некорректное количество элементов.'
    )
    if post_data:
        assert post_data in respons_data['results'], (
            f'Проверьте, что для эндпоинта `{url}` настроена пагинация. '
            'Значение параметра `results` отсутствует или содержит '
            'некорректную информацию о существующем объекте.'
        )


def check_permissions(client, url, data, user_role, objects,
                      expected_status):
    sufix = 'slug' if 'slug' in objects[0] else 'id'

    response = client.post(url, data=data)
    assert response.status_code == expected_status, (
        f'Проверьте, что POST-запрос {user_role} к `{url}` возвращает ответ '
        f'со статусом {expected_status}.'
    )
    response = client.patch(f'{url}{objects[0][sufix]}/', data=data)
    assert response.status_code == expected_status, (
        f'Проверьте, что PATCH-запрос {user_role} к `{url}<{sufix}>/` '
        f'возвращает ответ со статусом {expected_status}.'
    )
    response = client.delete(f'{url}{objects[0][sufix]}/')
    assert response.status_code == expected_status, (
        f'Проверьте, что DELETE-запрос {user_role} к `{url}<{sufix}>/` '
        f'возвращает ответ со статусом {expected_status}'
    )


def create_recipe(
    client, ingredients: list, tags: list,
    image: str, name: str,
    text: str, cooking_time: int
):
    data = {
        'ingredients': ingredients, 'tags': tags,
        'image': image, 'name': name,
        'text': text, 'cooking_time': cooking_time}
    response = client.post(
        '/api/recipes/', data=data
    )
    assert response.status_code == HTTPStatus.CREATED, (
        'Если POST-запрос авторизованного пользователя к '
        '`/api/recipes/` содержит корректные данные - '
        'должен вернуться ответ со статусом 201.'
    )
    return response


def add_recipe(client, recipe_id):
    response = client.post(
        f'/api/recipes/{recipe_id}/shopping_cart/',
    )
    assert response.status_code == HTTPStatus.CREATED, (
        'Если POST-запрос авторизованного пользователя к '
        '`/api/recipes/{recipe_id}/shopping_cart/` содержит '
        'корректные данные - должен вернуться ответ со статусом 201.'
    )
    return response


def add_recipe_to_favourites(client, id_1, id_2):
    response = client.post('/api/recipes/{id_1}/favorite/')
    assert response.status_code == HTTPStatus.CREATED, (
        'Если POST-запрос авторизованного пользователя к '
        '`/api/recipes/{id_1}/favorite/` '
        'содержит корректные данные - должен вернуться ответ со статусом 201.'
    )


def subscribe_on_user(client, recepies_limit):
    response = client.post(
        '/api/users/{id}/subscribe/',
        data={'recepies_limit': recepies_limit}
    )
    assert response.status_code == HTTPStatus.CREATED, (
        'Если POST-запрос авторизованного пользователя к '
        '`/api/users/{id}/subscribe/` '
        'содержит корректные данные - должен вернуться ответ со статусом 201.'
    )
