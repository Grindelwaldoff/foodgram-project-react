FROM python:3.7-slim

WORKDIR /app

COPY . .

RUN pip3 install -r requirements.txt --no-cache-dir
RUN apt-get update -y
RUN apt-get install nano -y
RUN apt-get install wkhtmltopdf -y

CMD [ "gunicorn", "foodgram_back.wsgi:application", "--bind", "0:8000"]
