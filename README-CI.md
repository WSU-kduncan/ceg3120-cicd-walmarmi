# Project 4:

# Part 1:
## 1 - Docker Setup:
- I downloaded Docker Desktop and I connected it to my GitHub account. To make sure it's there, run `docker --version`. 

## 2 - Manually setting up a container:
- The command ran to run it: `docker run -p 4200:4200 walmarmi-ceg3120`
	- `docker`= what we're using to run it
	- `run` = telling docker to run the command
	- `-p 4200:4200` = this maps the port of the host to the port in the container which is 4200 by default
	- `walmarmi/jaca-ceg3120`= name of the docker image that is running.
- To verify it's runnning: `https://localhost:4200`

## 3 - Dockerfile & Building Images:

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
    	- `sudo docker run -p 80:80 -it walmarmi/jaca-ceg3120`: run it for the Angular application
       	- `http://localhost:4200/`: If it loads, it works

# Part 2:

## 1 - Configuring Github Repository Secrets:
- In Dockerhub, you can create a token through your Docker account settings. In Github, in Settings -> Secrets and Variables -> Actions, you can individually create secrets for your Docker username and Docker Password (or Token). This creates a connection between Dockerhub and Github with read and write.

## 2 - CI with Github Actions:
- To create the workflow yml file, I used ChatGPT for syntax errors and through here, we can specify the actions and the steps to create the image. There, we reference our Docker Username and Password through `secrets`.

## Resources:
- [Actions Syntax](https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions#jobsjob_idsecretssecret_id)
- [Docker build](https://stackoverflow.com/questions/60984684/how-to-create-docker-compose-yml-file)
- ChatGPT
