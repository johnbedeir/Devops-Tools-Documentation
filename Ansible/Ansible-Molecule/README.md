# Ansible Molecule 
[Watch Ansible Molecule شرح step by step on YouTube](https://youtu.be/no8ZM1F7rhA)

# Step 1:

Make sure you have the following installed:

```
python
pip
```

# Step 2:

Install the requirements.txt file _(make sure you stand inside the directory that contains the requirements file)_

```bash
cd molecule/default

pip install -r requirements.txt
```

# Step 3:

Create the docker containers _(make sure you are one step back from the molecule directory )_

```bash
cd ../../
molecule create
```

# Step 4:

Run the converge playbook file on both containers:

```bash
molecule converge
```

# Step 5:

When you are done and would like to remove the containers:

```bash
molecule destroy
```

# Get inside the containers:

Use the following command to see the created machine names:

```bash
molecule login
```

Use the following command to get inside the container:

```bash
molecule login -h <machine-name>
```

# For Testing:

You can run this to test creating > running converge > and destroy all at once:

```bash
molecule test
```
