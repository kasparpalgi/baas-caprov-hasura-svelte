# captain-definition method

`captain-definition` is a simpler method. Starts from a node:19-alpine image, sets up the working directory, copies the package.json and build directory into the image, sets some environment variables, exposes port 80, and specifies the command to start the app. It doesn't use a multi-stage build process or set the timezone.

Video by Nick: https://www.youtube.com/watch?v=a08ZsxXhrD8

https://i.imgur.com/x61wsQ0.png - github
