# pull the official base image
FROM python:3.8.3-alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip 
COPY ./requirements.txt /usr/src/app
RUN pip install -r requirements.txt
 

# copy project
COPY . /usr/src/app

#For Static folder
RUN python manage.py collectstatic

VOLUME /static

EXPOSE 8000
ENTRYPOINT ["sh","./gunicorn_server.sh"]

