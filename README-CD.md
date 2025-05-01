## README-CD.md

# 1. Generating tags
 - How to see tags in a git repository: git tag
 - How to generate a tag in a git repository: git tag -a v*.*.*
 - How to push a tag in a git repository to GitHub: git push

# 2. Semantic:
 - Based on the reference, v*.*.* is a safe way for a tag to match and to be pushed to the repository. It will trigger only when the Git tag matching it is pushed. 

Workflow:
	- `name`: what it's for
	- `on: push: tags: -`v*.*.*`: on push, it will run semantic version tags like v1.0.0
	- `checkout code`: This will pull the recent and most latest version of your project from GitHub so it has the code to build the Docker image
	- `extract metadata`: This will read version of the tag and prepare the set of tags for the image. It creates the `latest`, `major`, and `major.minor` tags.
	- `set up docker build`: this is when you build the docker image on Github's server.
	- `log in to docker`: now that the image is created, you need somewhere to push it to so we need to log in to docker. this uses the secrets that were saved in the GitHub repo like your username and the generated token to push the image there.
	- `build and push docker`: this is where it finally happens where it will build the image using the prior code and use the tags that were created with multiple versions.

# 3. Testing and validating:
	- To test: run `git tag v1.0.0` then `git push origin v1.0.0`
	- GitHub & DockerHub: In your repo's Actions, it should show the status of your image to be 'SUCCESS' and in Dockerhub, it should show up in your DockerHub repositories.
