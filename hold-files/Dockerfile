# Use an official Python runtime as a parent image
FROM python:3.8-buster

LABEL maintainer="mdoherty@hotmail.fr"

#Set environment variable

ARG POSTGRES_USER
ARG POSTGRES_PW

ENV POSTGRES_USER=$POSTGRES_USER
ENV POSTGRES_PW=$POSTGRES_PW
ENV POSTGRES_DB=holddb
ENV FLASK_ENV=development
ENV FLASK_DEBUG=1

# Set the working directory to /hold
WORKDIR /hold

# Copy the current directory contents into the container at /hold
ADD . /hold

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Run manage.py when the container launches
CMD python manage.py runserver -h 0.0.0.0
