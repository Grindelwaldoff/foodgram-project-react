from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _


def validate_fields(value):
    if not (any(char in value for char in r'^[a-zA-Z0-9]*\Z')):
        raise ValidationError(
            _(f'{value} contains disallowed characters'),
            params={'value': value},
        )
