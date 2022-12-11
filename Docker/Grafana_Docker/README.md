# Run Grafana into Docker container 

![alt text](grafana.png)

## What this command will do?

### 1. Run a container named grafana-docker
### 2. Using port 3000
### 3. Set presistant volume name to grafana_data
### 4. Set presistant volume path to /var/lib/grafana
### 5. Create the container from the image grafana/grafana 

```

docker run -d --name grafana-docker -p 3000:3000 -v grafana_data:/var/lib/grafana grafana/grafana 

```

## Access Grafana from your browser 

```
http://localhost:3000
```

## Replace your localhost with a domain name 

```
sudo vim /etc/hosts
```

### Add the following line:
`replace` **grafana.local.com** `with your prefered domain name`
```
127.0.0.1       grafana.local.com
```

## Access Grafana using the new domain from your browser 
```
http://grafana.local.com:3000
```


