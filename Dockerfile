# Use the latest Node.js base image
FROM node:latest

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app for production
RUN npm run build

# Install a lightweight HTTP server to serve the built React app
RUN npm install -g serve

# Expose the port for the HTTP server
EXPOSE 80

# Command to serve the built React app using the HTTP server
CMD ["serve", "-s", "-l", "80", "build"]
