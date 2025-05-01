## Project 4:

# 1 - Docker Setup:
- I downloaded Docker Desktop and I connected it to my GitHub account. To make sure it's there, run `docker --version`. 

# 2 - Manually setting up a container:
- The command ran to run it: `docker run -p 4200:4200 walmarmi-ceg3120`
	- `docker`= what we're using to run it
	- `run` = telling docker to run the command
	- `-p 4200:4200` = this maps the port of the host to the port in the container which is 4200 by default
	- `walmarmi/jaca-ceg3120`= name of the docker image that is running.
- To verify it's runnning: `https://localhost:4200`

# 3 - Dockerfile & Building Images:

- Dockerfile rundown:
	- `FROM node:18-bullseye` = Container image used.
	- `WORKDIR /app` = set the directory working inside the container
	- `RUN npm install -g @angular/cli@15.0.3` = Install Angular with npm
	- `COPY angular-site/wsu-hw-ng-main/package*.json ./` = Only copy the package files needed for the install
	- `RUN npm install` = This is to install dependencies
	- `COPY angular-site/ ./` = Copy the entire thing
	- `CMD ["ng", "serve", "--host", "0.0.0.0"]` = Used hints and references to start the app

- Building Images:
	- `docker build -t walmarmi/jaca-ceg3120`
		- `docker` = use docker
		- `build` = tells docker to build a new image from the Dockerfile that was created
		- `-t` = Tags for quick reference
		- `walmarmi/jaca-ceg3120` = name of the image
