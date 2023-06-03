# Deploy Go App on Minikube

This application is a simple survey where the go app run on `localhost:8080` and when you send a `POST` request as a `JSON` format it will be added automatically in the `MONGODB` database.

## 1. Deploy application on `Minikube`:

`NOTE:` Make sure `Minikube` is already installed and running using `minikube start`

```
chmod +x deploy.sh

deploy.sh
```

## 2. Get application and Mongodb `URL`:

```
minikube service -n go-survey go-app --url

minikube service -n go-survey mongo-app-service --url
```

Output:

The outputs are the URL for both the Go App and MongoDB

```
http://<your-ip>:<port>
http://<your-ip>:<port>
```

## 3. `GET` and `POST` request

Using [Postman](https://www.postman.com/) and the following input:

The `Header` for `mongodb` using `GET` request:

```
Accept: application/json
```

The `Header` for `App` using `POST` request:

```
Accept: application/json
Content-Type: application/json
```

## 4. Access the Database using [Studio3T](https://studio3t.com/knowledge-base/articles/installation/)

Connect to the Database using the following inputs:

```
URI: mongodb://<your-ip>:<port>
Database Name: surveyDB
```

Once you connect to the Database use `Postman` to send a `POST` request using the app `URL`:

```
http://<your-ip>:<port>
```

And to send request by writing in `JSON` format at the `Body (raw)` section as shown:

```
{
    "answer1": "Python",
    "answer2": "PHP",
    "answer3": "GoLang"
}
```

Once you send a `POST` request the data should be shown in the `Database`

### Finally to delete deployment:

```
chmod +x delete.sh

./delete.sh
```
