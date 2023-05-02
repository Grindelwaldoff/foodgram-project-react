from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _

def validate_username(value, field_name):
    if any(char in value for char in '!@#$%^'):
        raise ValidationError(
            _(f'{field_name} cannot contain special characters'),
            params={'value': value},
        )