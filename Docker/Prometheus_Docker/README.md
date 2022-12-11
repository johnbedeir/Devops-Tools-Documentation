# Run Prometheus into Docker container 

![alt text](prometheus.png)

## What this command will do?

### 1. Run a container named prometheus-docker
### 2. Using port 9090
### 3. Set presistant volume name to prometheus_data
### 4. Set promethues to run the locally yaml file into the presistant volume ./prometheus.yml
### 5. Create the container from the image prom/prometheus

```

docker run -d --name prometheus-docker -p 9090:9090 -v prometheus_data:./prometheus.yml prom/prometheus

```

## Access Prometheus from your browser 

```
http://localhost:9090
```

## Replace your localhost with a domain name 

```
sudo vim /etc/hosts
```

### Add the following line:
`replace` **prometheus.local.com** `with your prefered domain name`
```
127.0.0.1       prometheus.local.com
```

## Access Prometheus using the new domain from your browser 
```
http://prometheus.local.com:9090
```


