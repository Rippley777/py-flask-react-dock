# Use an official Python runtime as a parent image
FROM python:3.8-slim as backend

# Set the working directory in the container
WORKDIR /app

# Copy the backend application
COPY ./app.py /app

# Install Flask
RUN pip install flask flask_restx flask_cors

# Expose the port the app runs on
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=app.py

# Run app.py when the container launches
CMD ["flask", "run", "--host=0.0.0.0"]

# Use Node.js 14 as a base image for the frontend
FROM node:20 as frontend

# Set the working directory for the frontend
WORKDIR /app/frontend

# Copy the frontend application
COPY ./frontend /app/frontend

# Install dependencies
RUN npm install

# Build the Next.js app
RUN npm run build

# Expose the port the Next.js server uses
EXPOSE 3000

# Run the Next.js app
CMD ["npm", "start"]