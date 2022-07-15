# Application Deployment

This will create deployment for 3 pods with 3 containers using the following docker images:

[triple3a/laravel-app](https://hub.docker.com/repository/docker/triple3a/laravel-app)

[triple3a/laravel-app-mysql-5.7](https://hub.docker.com/repository/docker/triple3a/laravel-app-mysql-5.7)

[triple3a/laravel-app-phpmyadmin](https://hub.docker.com/repository/docker/triple3a/laravel-app-phpmyadmin)

The docker images that was created earlier using the following:

[laravel-app/Dockerfile](https://github.com/johnbedeir/e-conomic/blob/dev/laravel-app/Dockerfile)

[laravel-app/docker-compose](https://github.com/johnbedeir/e-conomic/blob/dev/laravel-app/docker-compose.yml)

```
deployment.yaml
```

---

This will create the service for the php-apache image

```
service-frontend.yaml
```

---

This will create the service for mysql

```
service-db.yaml
```

---

This will create the service for phpmyadmin

```
service-phpmyadmin.yaml
```
