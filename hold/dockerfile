# Use an official Python runtime as a parent image
FROM python:2.7-slim

LABEL maintainer="mdoherty@hotmail.fr"

#Set environment variable

ENV POSTGRES_USER=pguser
ENV POSTGRES_PW=password
ENV POSTGRES_DB=holddb

# Set the working directory to /hold
WORKDIR /hold

# Copy the current directory contents into the container at /hold
ADD . /hold

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Run manage.py when the container launches
CMD python manage.py runserver -h 0.0.0.0
