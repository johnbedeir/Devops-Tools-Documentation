# Deploying Ansible Tower (AWX) with AWX Operator on AWS

<img src=cover.png>

This guide will help you deploy Ansible Tower (AWX) on AWS using the AWX Operator.

## Prerequisites

- An AWS account
- Kubernetes cluster running Minikube or on AWS (EKS or other Kubernetes solution)
- `kubectl` and `helm` CLI tools installed and configured to connect to your Kubernetes cluster

## Installation Steps

### 1. Clone the AWX Operator Repository

First, clone the AWX Operator repository:

```bash
git clone https://github.com/ansible/awx-operator.git
cd awx-operator/ansible
```

### 2. Deploy the AWX Operator

Create a namespace first:

```bash
kubectl create namespace awx
```

Use the following command to apply the AWX Operator configuration to your Kubernetes cluster:

```bash
kubectl apply -f  instantiate-awx-deployment.yml
```

This will install the AWX Operator on your cluster, which is responsible for managing the lifecycle of AWX instances.

### 3. Create an AWX Service

Now, create an AWX instance by applying a `Service` configuration. Save the following YAML as `awx-service.yaml`:

```yaml
apiVersion: awx.ansible.com/v1beta1
kind: AWX
metadata:
  name: awx-demo
spec:
  service_type: nodeport
```

Then, apply it using:

```bash
kubectl apply -f awx-service.yaml
```

### 5. Login to AWX

To open the AWX web interface, you need to port-forward the awx-service to localhost

Using `K9s` Navigate to `svc` then `awx-demo-service` press `shift+f` and confirm as shown:

<img src=img-1.png>

Now open your browser on `localhost:8052` and login using the following credentials:

- Username: `admin`
- Password: Retrieve the password with:

  ```bash
  kubectl get secret awx-demo-admin-password -o jsonpath="{.data.password}" | base64 --decode
  ```

## Cleanup

To delete the AWX instance and operator, use:

```bash
kubectl delete -f awx-instance.yaml
kubectl delete -k .
```

## References

- [AWX Operator GitHub](https://github.com/ansible/awx-operator)
- [AWX Documentation](https://github.com/ansible/awx-operator/tree/devel/docs)

---

**Note**: Make sure your cluster has enough resources for deploying AWX, and consult the official AWX documentation for any custom configurations.
