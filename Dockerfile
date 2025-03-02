# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Node.js and nport
RUN apt update && apt install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt install -y nodejs && \
    npm install -g nport

# Expose port 5000
EXPOSE 5000

# Define environment variable for Flask
ENV FLASK_APP=AgriGo/app.py

# Run the application
CMD ["flask", "run", "--host=0.0.0.0"]
