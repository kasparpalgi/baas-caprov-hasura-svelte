# Dockerfile method

## Original Dockerfile

This method uses a multi-stage build process. This process has two stages, the "build" stage and the "runtime" stage:

1. In the build stage, the Dockerfile starts from a node:19.7-alpine image. It sets the working directory, copies the entire project into the Docker image, sets the timezone, installs the npm dependencies, and runs a build command.

2. In the runtime stage, it again starts from a node:19.7-alpine image, sets the working directory, sets the timezone, and copies specific files (the package.json, package-lock.json, and the build directory) from the build stage into the new Docker image. This results in a leaner final Docker image as it only includes the build artifacts and dependencies needed to run the app.

## Improved Dockerfile

1. Added a LABEL instruction to add the version and maintainer metadata to the Docker image.
2. Added an ENV instruction to set the EXAMPLE_VARIABLE environment variable.
3. Added a HEALTHCHECK instruction that uses curl to send a HTTP request to the application every 5 minutes and checks the response. If the response is unsuccessful, Docker considers the health check to fail.
4. Moved COPY instructions after the RUN instructions for curl and tzdata installation, and combined these RUN instructions together, to take advantage of Docker's layer caching. Docker will re-run a step (and all steps after it) only if something in that step changes. Since your application code is likely to change more frequently than the curl and tzdata packages, it's more efficient to install the packages first.

## Notes

Stanislav: https://www.youtube.com/watch?v=NLjolI9FwCU (3 months ago, 46 likes, Github repo)

Edit svelte.config.js -> adapter-node and adapter: adapter({ out: 'build' }) https://i.imgur.com/0A8MyNl.png

Create: .github/workflows/build.yml

Change in two places the timezone as needed. Eg.: `ARG TZ=Europe/Tallinn`

https://i.imgur.com/Vm4DRBE.png

https://i.imgur.com/iHcDWCt.png

https://www.youtube.com/watch?v=NLjolI9FwCU

https://github.com/khromov/self-hosted-sveltekit-demo/

https://www.youtube.com/watch?v=KbIFRVvdgA8 (with sound issues?)