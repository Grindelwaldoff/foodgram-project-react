from http import HTTPStatus

import pytest

from .utils import recipe_correct_data


@pytest.mark.django_db(transaction=True)
class TestRecipe:
    url_recipe = '/api/recipes/'
    url_favorites = '/api/recipes/1/favorites/'

    def test_recipe_add_with_valid_data(self, admin_client, Recipes):
        obj_num = Recipes.objects.count()
        response = admin_client.post(self.url_recipe, data=recipe_correct_data)
        assert response.status_code != HTTPStatus.NOT_FOUND, (
            f"Эндпоинт `{self.url_signup}` не найден. Проверьте настройки "
            "в *urls.py*."
        )
        assert Recipes.objects.count() == obj_num + 1, (
            f"Эндпоинт `{self.url_signup}` не создает модель рецепта",
            response.text()
        )
