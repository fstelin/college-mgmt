FROM python:3.11.0-buster

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt update

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

RUN python manage.py makemigrations
RUN python manage.py migrate
CMD gunicorn --bind 0.0.0.0:$PORT CollegeMgmt.wsgi:application
