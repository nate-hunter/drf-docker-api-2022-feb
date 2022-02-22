FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Setup directory structure for where to store application source code
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# User that's going to run the application
# `adduser` creates a user / `-D` creates a user for running applications only
# If this is not here, Docker will run app from root account
RUN adduser -D user
USER user