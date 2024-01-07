# Running MongoDB in Docker

<img src="mongo.png"  width="255"> <img src="docker.png"  width="150">

This guide outlines the steps to run MongoDB in a Docker container with an attached volume. This allows you to persist the data outside the container and preserve it even when the container is removed.

🎥 For a detailed walkthrough into this project, check out my video on YouTube: [HERE](https://youtu.be/YSM7ayJ5QyM).

## Prerequisites

- Docker installed on your machine

## Step 1:

1. Replace `<CONTAINER_NAME>` and `<VOLUME_NAME>` with the desired container name and volume name.

2. Run MongoDB in a Docker container with the volume attached:

   ```
   docker run -d --name <CONTAINER_NAME> -p 27017:27017 -v <VOLUME_NAME>:/data/db mongo:latest
   ```

   This command starts a MongoDB container named `<CONTAINER_NAME>`, maps port `27017` of the container to port `27017` on the host machine, and attaches the volume called `<VOLUME_NAME>` to the container's `/data/db` directory.

## Step 2:

### 1. Open [Studio3T](https://studio3t.com/) app to access the mongodb

### 2. Connect to the mongodb using the following URI:

```
mongodb://localhost:27017
```

### 3. Add a name for the connection.

### 4. Create a new database.

<img src=add_database.png width=600>
<img src=add_database_name.png width=600>
<img src=open_shell.png width=600>

### 5. To select the database:

```
use my_db
```

This command switches to the `my_db` database. If the database doesn't exist, MongoDB will create it automatically when you start using it.

### 6. Create a Collection in the selected database

```
db.createCollection("my_collection")
```

This command creates a collection named `my_collection` within the `my_db` database.

<img src=create_collection.png width=600>

### 7. Insert documents into the collection:

```
db.my_collection.insertOne({
"name": "John Doe",
"age": 30,
"email": "johndoe@example.com",
"address": {
   "street": "123 Main St",
   "city": "New York",
   "state": "NY",
   "zipcode": "10001"
},
"interests": ["programming", "reading", "traveling"]
})
```

This command inserts multiple documents into the `my_collection` collection with corresponding `name`, `age`, `email`, `address`, `interests` values.

### 8. Find documents in the collection:

```
db.my_collection.find()
```

This command retrieves all documents from the `my_collection` collection and displays them.

### 9. Delete the created collection:

```
db.my_collection.drop()
```
