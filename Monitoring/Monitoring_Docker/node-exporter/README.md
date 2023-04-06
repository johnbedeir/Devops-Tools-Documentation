# Run Node Exporter locally using Docker-Compose

### What this file will do?

#### 1. Run a container named node-exporter
#### 2. Using port 9100
#### 3. Mount root volume from host into the container using read only permissions
#### 4. Create the container from the image prom/node-exporter:latest

```
docker-compose up -d
```
