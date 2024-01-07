# Run Portainer into Docker container

![alt text](portainer.png)

🎥 For a detailed walkthrough into this project, check out my video on YouTube: [HERE](https://youtu.be/nanvypQBgA0).

### What the following command do?

#### 1. Run a container named portainer

#### 2. Using port 9000

#### 3. Set presistant volume name to portainer_data

#### 4. Set presistant volume path to /data

#### 5. Create the container from the image portainer/portainer-ee:latest

#### 6. Set the container to always restart using --restart=always

```

docker run -d -p 9000:9000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ee:latest

```

## Access Portainer from your browser

```
http://localhost:9000
```

## Replace your localhost with a domain name

```
sudo vim /etc/hosts
```

### Add the following line:

`replace` **portainer.local.com** `with your prefered domain name`

```
127.0.0.1       portainer.local.com
```

## Access Portainer using the new domain from your browser

```
http://portainer.local.com:9000
```
