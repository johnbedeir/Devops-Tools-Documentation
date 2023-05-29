# Nodejs and Postgres Application

```markdown
# Node.js App with PostgreSQL

This application demonstrates how to setup a simple Express.js application that connects to a PostgreSQL database.

## 1. Setting up Node.js Application

You will need Node.js and npm installed on your local development machine.

To install the required dependencies, follow these steps:

- Initialize a new npm project:
```

```
npm init -y
```

This command will create a `package.json` file.

- Install Express.js, pg (PostgreSQL client for Node.js), and ejs (embedded JavaScript templates):

  ```bash
  npm install express pg ejs
  ```

  These commands install the dependencies and add them to your `package.json` file.

## 2. Creating the Database Table

Connect to your PostgreSQL database and run the following SQL command to create the `posts` table:

```sql
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## 3. Inserting Data Into the Database Table

To insert data into the `posts` table, use the following SQL commands:

```sql
INSERT INTO posts (title, body) VALUES ('First Post', 'This is the first post.');
INSERT INTO posts (title, body) VALUES ('Second Post', 'This is the second post.');
INSERT INTO posts (title, body) VALUES ('Third Post', 'This is the third post.');
```

## 4. Running the Application Locally

To start the Node.js application, you can run:

```bash
node app.js
```

This will start the server on port 8000. You can visit `http://localhost:8000` in your browser to view the application.

## 5: Running the Application with Docker Compose

Ensure that you have Docker and Docker Compose installed on your machine.

To start the application with Docker Compose, run:

```bash
docker-compose up
```

This starts the server and the PostgreSQL database in Docker containers. You can visit `http://localhost:8000` in your browser to view the application.

## 6: Deploying the Application to Minikube

Make sure you have Minikube and kubectl installed on your local machine.

Start Minikube:

```bash
minikube start
```

Then, apply the Kubernetes deployment and service configuration located in the `k8s` directory:

```bash
create ns nodejs-app

kubectl apply -f k8s/
```

Get the application `URL`:

```bash
kubecl get svc -n nodejs-app
```

Output:

```
NAME                 TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
nodejs-app-service   NodePort   10.102.133.202   <none>        8000:30511/TCP   109s
postgres-service     NodePort   10.110.168.171   <none>        5432:31204/TCP   109s

```

Replace the `$SERVICE_NAME` with each of the services names lister above.

```
minikube service -n nodejs-app $SERVICE_NAME --url
```

Then, you can visit app URL in your browser to view the application running on Minikube, and use the Database URL to connect to the database using [BeeKeeper App](https://www.beekeeperstudio.io/)
