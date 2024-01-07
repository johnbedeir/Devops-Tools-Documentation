# Running PostgreSQL in Docker

<img src="Postgresql.png"  width="130"> <img src="docker.png"  width="150">

This guide outlines the steps to run PostgreSQL in a Docker container with an attached volume. This allows you to persist the data outside the container and preserve it even when the container is removed.

🎥 For a detailed walkthrough into this project, check out my video on YouTube: [HERE](https://youtu.be/3aHKZ5ss8nc).

## Prerequisites

- Docker installed on your machine

## Steps

1. Replace `<CONTAINER_NAME>`, `<PASSWORD>`, `<VOLUME_NAME>` with the desired container name, password, and volume name.

2. Run PostgreSQL in a Docker container with the volume attached:

   ```
   docker run -d --name <CONTAINER_NAME> -e POSTGRES_PASSWORD=<PASSWORD> -p 5432:5432 -v <VOLUME_NAME>:/var/lib/postgresql/data postgres:latest
   ```

   This command starts a PostgreSQL container named `<CONTAINER_NAME>`, sets the password for the default `postgres` user to `<PASSWORD>`, maps port `5432` of the container to port `5432` on the host machine, and attaches the volume called `<VOLUME_NAME>` to the container's `/var/lib/postgresql/data` directory.

3. Access the database container:

   ```
   docker exec -it <CONTAINER_NAME> bash
   ```

   This command allows you to access the shell inside the PostgreSQL container.

4. Login to PostgreSQL as the default `postgres` user:

   ```
   psql -U postgres
   ```

   This command logs you into the PostgreSQL server running inside the container using the default `postgres` user and your `<PASSWORD>`.

5. Create a database:

   ```
   CREATE DATABASE my_db;
   ```

   This SQL statement creates a database named `my_db` within the PostgreSQL server.

   Show Databases:

   ```
   /l
   ```

6. Connect to the created database:

   ```
   \c my_db
   ```

   This command connects to the `my_db` database for subsequent operations.

7. Create a table:

   ```
   CREATE TABLE my_table (id INT, name VARCHAR(255));
   ```

   This SQL statement creates a table named `my_table` with columns `id` (integer) and `name` (varchar) within the `my_db` database.

   Show Tables in the connected database:

   ```
   \dt
   ```

8. Insert data into the table:

   ```
   INSERT INTO my_table (id, name) VALUES (1, 'PHP'), (2, 'PYTHON'), (3, 'JAVA');
   ```

   This SQL statement inserts three rows of data into the `my_table` table with corresponding `id` and `name` values.

9. Check the table:

   ```
   SELECT * FROM my_table;
   ```

   This SQL statement retrieves all rows from the `my_table` table and displays them.

10. Exit from the PostgreSQL prompt:

    ```
    \q
    ```

    This command exits the PostgreSQL prompt and returns you to the shell inside the container.

11. Exit from the container:

    ```
    exit
    ```

    This command exits the container's shell and returns you to the host machine's shell.
