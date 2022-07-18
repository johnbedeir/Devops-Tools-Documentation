# Python-Django-Web-App

## How to run?

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
