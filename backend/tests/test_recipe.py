from http import HTTPStatus

import pytest

from .utils import recipe_correct_data, create_recipe, add_recipe_to_favorites


@pytest.mark.django_db(transaction=True)
class TestRecipe:
    url_recipe = '/api/recipes/'
    url_favorites = '/api/recipes/1/favorite/'

    def test_recipe_add_with_valid_data(self, admin_client):
        response = create_recipe(
            client=admin_client,
            ingredients=[{
                'id': 1,
                'amount': 12
            }],
            tags=[
                1,
            ],
            image='dslfjksdflk',
            name='TestRecipe',
            text='test_desc',
            cooking_time=123
        )
        assert response.status_code != HTTPStatus.NOT_FOUND, (
            f"Эндпоинт `{self.url_recipe}` не найден. Проверьте настройки "
            "в *urls.py*."
        )

    def test_favorites(self, admin_client):
        response = add_recipe_to_favorites(
            client=admin_client,
            id_1=1
        )
        assert response.status_code != HTTPStatus.NOT_FOUND, (
            f"Эндпоинт `{self.url_favorites}` не найден. Проверьте настройки "
            "в *urls.py*."
        )
