# Use an official Python runtime as a parent image
FROM python:3.10

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /Operations_ServiceIndex_Django

# Install system dependencies
RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y vim && \
    apt-get install -y git libpq-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy Pipfile and Pipfile.lock to container
COPY Pipfile Pipfile.lock /Operations_ServiceIndex_Django/

# Install pipenv and project dependencies
RUN pip install pipenv && \
    # pipenv install --deploy --ignore-pipfile -v
    pipenv install -v

RUN mkdir -p /conf
# RUN mkdir -p /soft
RUN chmod -R +x /conf

# Set the environment variable
ENV APP_CONFIG=/conf/serviceindex.json

# Expose the port the app runs on
EXPOSE 8000

# Start [thanks to Eric's no stop entry point]
ENTRYPOINT ["/usr/bin/tail"]
CMD ["-f","/dev/null"]

