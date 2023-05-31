ARG PYTHON_VERSION=3.8

FROM python:${PYTHON_VERSION}-slim

ENV SETTINGS_SECRET_KEY=${SETTINGS_SECRET_KEY}
ENV SECRET_KEY=${SECRET_KEY}
ENV DATABASE_URL=${DATABASE_URL}

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-venv \
    python3-dev \
    python3-setuptools \
    python3-wheel

RUN mkdir -p /app
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# RUN python manage.py collectstatic --noinput
# RUN python manage.py makemigrations && python manage.py migrate --run-syncdb && python manage.py runserver 0.0.0.0:3000

EXPOSE 8080

# replace APP_NAME with module name
CMD ["gunicorn", "--bind", ":8080", "--workers", "1", "mysite.wsgi"]
