
1. how to search a docker image in hub.docker.com
```sh
docker search httpd
```
2. Download a docker image from hub.docker.com
```sh
docker image pull <image_name>:<image_version/tag>
```

3. Show all docker images on your local system
```sh
docker images
```

4. Build docker image from Dockerfile
```sh
docker build -t <image_name> . #the dot in the end specify the current directory where the Dockerfile is located 
```

5. Create a docker container from image
```sh
docker run --name <container_Name> <image_name>:<image_version/tag>

docker - run your container in back ground (detached)
 
docker run -d --name <container_Name> <image_name>:<image_version/tag>
```

6. Expose your application to host server
```sh
docker run -d --name <container_Name> -p <host_port>:<container_port> <image_name>:<Image_version/tag>

docker run -d --name httpd_container -p 8080:80 httpd:latest
```

7. Show all running containers
```sh
docker ps
```

8. Show all docker container (running, stpooed, terminated, etc...)
```sh
docker ps -a
```

9. Get inside a container

```sh
docker exec -it <container_Name> bash
```

10. Stop a container 
```sh
docker stop <container_id>
```

11. Start a container which is stopped 

```sh
docker start <container_id>
```
12. Remove a container

```sh
docker rm <container_id>
```

13. Remove docker image
```sh
docker rmi <image_id>
```
