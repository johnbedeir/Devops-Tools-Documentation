# Docker Compose شرح

Docker compose is a tool for defining and running multiple-containers. With `docker-compose` you use a `YAML` file format to configure your application's services. Then, with a single command, you create and start all the services from your configuration.

[Watch Docker Compose شرح step by step on YouTube](https://youtu.be/mZdU7r8Rf5c)

This `docker-compose.yml` build and run two services, the first one is to build the `Dockerfile` we already have in `./product` directory which uses `python` docker image and run the application on `PORT: 5001`, while the second service is built using `php:apache` docker image to run the application on the webpage on `PORT: 5000`

### Run the application using the following command:
```
docker-compose up
```
