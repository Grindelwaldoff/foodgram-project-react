FROM python:3.7-slim

WORKDIR /app

COPY ./backend/foodgram_back .

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt --no-cache-dir

CMD [ "gunicorn", "foodgram_back.wsgi:application", "--bind", "0:8000"]