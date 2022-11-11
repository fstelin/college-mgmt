FROM python:3.11.0-buster

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PORT 8080

RUN apt update

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

RUN python manage.py makemigrations
RUN python manage.py migrate
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]