# Run Jenkins into Docker container

<img src="jenkins.png"  width="200" height="250">

🎥 For a detailed walkthrough into this project, check out my video on YouTube: [HERE](https://youtu.be/a55MCe_m-0I).

### What the following command do?

#### 1. Run a container named jenkins-docker

#### 2. Using port 8081

#### 3. Set presistant volume name to jenkins_home

#### 4. Set presistant volume path to /var/jenkins_home

#### 5. Create the container from the image jenkins/jenkins:lts-jdk11

```

docker run -d --name jenkins-docker -p 8081:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11

```

## Access Jenkins from your browser

```
http://localhost:8081
```

## Replace your localhost with a domain name

```
sudo vim /etc/hosts
```

### Add the following line:

`replace` **jenkins.local.com** `with your prefered domain name`

```
127.0.0.1       jenkins.local.com
```

## Access Jenkins using the new domain from your browser

```
http://jenkins.local.com:8081
```

`If you have jobs from your locally installed jenkins here is how to copy them using:`

### Copy Jenkins jobs from local into the jenkins container

```
sudo docker cp /var/jenkins/jobs/ jenkins-docker:/var/jenkins_home/
```

### Copy from local into container

```
sudo docker cp <full-local-path> <container-name>:<path-inside-container>
```

### Copy from container into local

```
sudo docker cp <container-name>:<path-inside-container> <full-local-path>
```
