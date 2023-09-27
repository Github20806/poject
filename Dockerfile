# Use an existing Docker image as a base
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update the package repository and install dependencies
RUN apt-get update && \
    apt-get install -y \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# Copy your application files into the container
COPY ./my-app /var/www/html

# Expose a port (if your application needs it)
EXPOSE 80

# Define a command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]
