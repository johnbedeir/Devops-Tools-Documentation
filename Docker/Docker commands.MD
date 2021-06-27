
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
docker image
```

4. Create a docker container from image
```sh
docker run --name <container_Name> <image_name>:<image_version/tag>

docker - run your container in back ground (detached)
 
docker run -d --name <container_Name> <image_name>:<image_version/tag>
```
5. Expose your application to host server
```sh
docker run -d --name <container_Name> -p <host_port>:<container_port> <image_name>:<Image_version/tag>

docker run -d --name httpd_container -p 8080:80 httpd:latest
```

6. Show all running containers
```sh
docker ps
```

7. Show all docker container (running, stpooed, terminated, etc...)
```sh
docker ps -a
```

8. Get inside a container

```sh
docker exec -it <container_Name> bash
```

9. Stop a container 
```sh
docker stop <container_id>
```

10. Start a container which is stopped 

```sh
docker start <container_id>
```
11. Remove a container

```sh
docker rm <container_id>
```

12. Remove docker image
```sh
docker rmi <image_id>
```