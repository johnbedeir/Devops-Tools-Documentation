# Python-Django-Web-App

## How to run Locally?

`NOTE: Make sure you already have Python and Pip installed`

### Step 1: Create .env file

` Create .env file from the env.example template and generate new SECRET_KEY using the following website:`

[DJANGO SECRET KEY GEN](https://djecrety.ir/)

### Step 2: Create the DataBase

`Rename the existing database file "db.sqlite3.example" to be "db.sqlite3"`

### Step 3: Install the requirements.txt

`Run the follwing command to install the requirements.txt`

```
pip install -r requirements.txt

OR

pip3 install -r requirements.txt
```

### Step 4: Run the application

`Run the application using the following command`

`NOTE: Replace <PORT> with the port number you would like to use ex:8000`

```
python3 manage.py runserver 0.0.0.0:<PORT>

```

---

## How to Run the app in Container?

## Method 1

`NOTE: Make sure you do the first two steps in the previous section first before proceeding`

### Step 1: Build Docker Image

```
docker build -t <image-name> .
```

### Step 2: Run Container

```
docker run -d --name <container-name> -p <hostport:containerport> <image-name>
```

## Method 2

`You can use the ansible playbook instead of the previous 2 steps, but make sure to change the image name in the playbook.yml`

```
ansible-playbook playbook.yml
```

---

## How to Run the app using docker-compose?

## Method 1

To start building Dockerfile and run container:

```
docker-compose up
```

To stop and remove running containers:

```
docker-compose down
```

## Method 2

You can use the playbook to automate the build and run of the docker-compose using playbook-dcompose.yml

```
ansible-palybook playbook-dcompose.yml
```
