# Terraform

## Terraform Files:

### Direct Terraform to run on AWS

```
provider.tf
```

---

### Create Ubuntu EC2 with 20gb volume

```
main.tf
```

---

### Create Security-group , Key-pair and download the Key-pair

```
security.tf
```

---

### Contains all the variables (region, ami, public-ssh)

```
variables.tf
```

---

### Reveal the public ip of the EC2 in the terminal after creating

```
output.tf
```

---

### Including the value of the variables

`This file need to be created with the vars in variables.tf, you will not find in the repository`

```
terraform.tfvars
```
