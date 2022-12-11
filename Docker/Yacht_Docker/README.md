# Run Yacht into Docker container 

![alt text](yacht.png)

## What this commands will do?

### 1. Run a container named yacht
### 2. Using port 8010
### 3. Set presistant volume name to yacht
### 4. Set presistant volume path to /config
### 5. Create the container from the image selfhostedpro/yacht
### 6. Set the container to always restart using --restart=always

```
docker run -d -p 8010:8000 --name yacht --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v yacht:/config selfhostedpro/yacht
```

## Access Yacht from your browser 

```
http://localhost:8010
```

## Replace your localhost with a domain name 

```
sudo vim /etc/hosts
```

### Add the following line:
`replace` **yacht.local.com** `with your prefered domain name`
```
127.0.0.1       yacht.local.com
```

## Access Yacht using the new domain from your browser 
```
http://yacht.local.com:9000
```