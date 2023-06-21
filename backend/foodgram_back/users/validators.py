from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _


def validate_username(value):
    if any(char in value for char in '!@#$%^'):
        raise ValidationError(
            _(f'{value} contains disallowed characters'),
            params={'value': value},
        )
