## Description of the project
This project is the final project in my training at Yandex.Praktikum. During its implementation, I worked with docker-compose, nginx, Yandex Cloud, and many other services and technologies. The project is quite complex and scalable, all the functionality is implemented in the form of an API on the Django Framework, including authentication, uploading and editing recipes, adding recipes to the cart, and editing the cart itself. All the buttons on the site call the backend and work with it.

## Description of implemented functions
* Adding and editing recipes
* Adding and editing recipes in the cart
* Sorting recipes by tags, author, favorites (django-filter), and pagination
* Generating a list of purchases based on the recipes added to the cart. (All ingredient grammars are summed up)
* Personal account: registration, login, password change, implemented using djoser
* Admin panel

## How to run the project:

Clone the repository and go to it in the command line:

```
git clone https://github.com/Grindelwaldoff/foodgram-project-react.git
```

Next, you need to add a file with environment variables with random data.

```
DB_ENGINE
DB_NAME
POSTGRES_USER
POSTGRES_PASSWORD
DB_HOST
DB_PORT
ALLOWED_HOSTS
SECRET_KEY
DEBUG
```

Then start the container:

```
sudo docker-compose up -d
```

### Perform migrations:

```
sudo docker-compose exec web python manage.py makemigrations

sudo docker-compose exec web python manage.py migrate
```

### Create a superuser:

```
sudo docker-compose exec web python manage.py createsuperuser
```

The site will open at this link:

```
http://127.0.0.1/
```

Technologies used in the project, or with which I had to work in the process of its implementation:
* Python 3.8
* Django 3.2
* PostgreSQL
* Linux
* Djoser
* NGINX
* Python-Dotenv
* Django-Filter
* Docker-Compose
* Django Rest Framework
Developer:
Vsevolod Rybnik
