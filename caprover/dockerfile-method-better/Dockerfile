# Specify the base image and alias it as sk-build
FROM node:18.17.0-alpine AS sk-build

# Set the working directory in the Docker image
WORKDIR /usr/src/app

# Set timezone as an argument
ARG TZ=Europe/London

# Copy the current directory contents into the Docker image
COPY . /usr/src/app

# Install curl and tzdata, then set the timezone
RUN apk --no-cache add curl tzdata && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# Install npm packages and run the build
RUN npm install && \
    npm run build

# Start a new build stage
FROM node:18.17.0-alpine

# Set the working directory in the Docker image
WORKDIR /usr/src/app

# Set timezone as an argument
ARG TZ=Europe/London

# Install curl and tzdata, then set the timezone
RUN apk --no-cache add curl tzdata && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# Copy necessary files from the previous stage
COPY --from=sk-build /usr/src/app/package*.json ./
COPY --from=sk-build /usr/src/app/build ./build

# Add metadata to the Docker image
LABEL version="0.2" \
      maintainer="https://github.com/kasparpalgi"

# Expose port 3000 to the outside world
EXPOSE 3000

# Healthcheck instruction to check the status of the app
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:3000/ || exit 1

# Run the app
CMD ["node", "build/index.js"]
