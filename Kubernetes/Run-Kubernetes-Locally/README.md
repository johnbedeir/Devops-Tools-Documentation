# How to install and run kubernetes locally (Ubuntu)

## 1. Intsall [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

## 2. Intsall [MiniKube](https://minikube.sigs.k8s.io/docs/start/)

## 3. Build and test application:

```bash
# (required) build the docker image from the Dockerfile
$ docker build -t comingsoon-img .
```

```bash
# (Optional) you can test the application locally with docker before pushing it to dockerhub to make sure it is working fine
$ docker run -d -p 8000:80 comingsoon-img
$ curl localhost:8000
```

```bash
# to stop and remove container after testing
$ docker stop comingsoon-img
$ docker rm comingsoon-img
```

```bash 
# (required) make sure you logedin to your dockerhub account before you push the image
$ docker login

# (required) tag the image that you will push with your dockerhub user   
$ docker tag comingsoon-img dockerhub.user/comingsoon-img 

# (required) push image to dockerhub
$ docker push dockerhub.user/comingsoon-img
```
## 4. Start MiniKube and run deployment:

```bash
# start minikube 
minikube start 
minikube dashboard
```

``` bash
# run deployment.yml & service.yml 
$ kubectl apply -f deployment.yml 
$ kubectl apply -f service.yml 
```
``` bash
# access your website locally in your browser
localhost:8080
```
