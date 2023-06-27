from django.core.validators import RegexValidator
from django.utils.translation import gettext_lazy as _


naming_validator_no_nums = RegexValidator(
    regex=r'^[а-яА-Яa-zA-Z]+$',
    message=_(
        'Поле должно содержать '
        'только буквы',
    ),
)

naming_validator_with_nums = RegexValidator(
    regex=r'^[а-яА-Яa-zA-Z0-9]+$',
    message=_(
        'Поле должно содержать '
        'только буквы и цифры',
    ),
)
# '!@#$%^'