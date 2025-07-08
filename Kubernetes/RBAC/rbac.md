# 🛡️ Play With Kubernetes RBAC Like Lego

<img src=cover.png>

## 🏢 Imagine Kubernetes as a Secure Company Building

Think of a **Kubernetes cluster** as a **secure office building**. Inside this building, you have:

- 🗂️ Departments (like `Jobs`, `Pods`, `Secrets`)
- 🧑 Employees (like apps or jobs running in Kubernetes)
- 🔐 Doors with access control (permissions to view, create, or delete things)
- 🪪 ID Badges (used to control who can do what this is the K8s Service Account)

But not every employee should access every room. This is where **RBAC** comes in, it’s the security system of your Kubernetes building.

---

## 🎯 What Is RBAC?

**RBAC (Role-Based Access Control)** is the system Kubernetes uses to say:

> "This person with this badge (ServiceAccount) is allowed to do these actions (verbs) on these things (resources) in this area (namespace or cluster)."

---

## 🔑 Key Components

| Kubernetes Component                 | Real-World Analogy                | Purpose                                                 |
| ------------------------------------ | --------------------------------- | ------------------------------------------------------- |
| **ServiceAccount**                   | Employee badge                    | Identifies **who** is acting inside the building (K8s). |
| **IAM Role (AWS)**                   | External building ID badge        | Grants access to **AWS services** outside the building. |
| **Role / ClusterRole**               | e.g., “can access HR, print docs” | Defines **what** the badge can do inside Kubernetes.    |
| **RoleBinding / ClusterRoleBinding** | Attaches the rules to a badge     | Gives those permissions to a ServiceAccount.            |

---

## 🧭 How It All Connects (Step-by-Step)

Let’s walk through a full example:

### ✅ You want to allow an app to create Jobs and access AWS Secrets

| Step | What You Do                                                              | What That Means (Analogy)                                                                 |
| ---- | ------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------- |
| 1️⃣   | Create an **IAM Role** in AWS with proper policies                       | You talk to the external security office (AWS) and give this employee a cloud access card |
| 2️⃣   | Create a **ServiceAccount** in Kubernetes                                | You issue a company badge and link it to the external badge using an annotation           |
| 3️⃣   | Create a **ClusterRole** for job creation and log viewing                | You define what rooms this badge can open in the building                                 |
| 4️⃣   | Bind that ClusterRole to the ServiceAccount using **ClusterRoleBinding** | You attach those access rules to the badge                                                |
| 5️⃣   | Use the ServiceAccount in your app/job                                   | Now the employee can enter and work in the rooms allowed, both inside and outside         |

---

## 🧩 Role vs ClusterRole

| Type            | Analogy                                     | Used When...                                                             |
| --------------- | ------------------------------------------- | ------------------------------------------------------------------------ |
| **Role**        | Keycard that works **only on one floor**    | You want access in **a specific namespace**                              |
| **ClusterRole** | Master keycard that works on **all floors** | You want access **across the whole building** or to **global resources** |

### 🔹 Role Example

```yaml
kind: Role
metadata:
  name: pod-reader
  namespace: dev
rules:
  - apiGroups: [""]
    resources: ["pods"]
    verbs: ["get", "list"]
```

### 🔹 ClusterRole Example

```yaml
kind: ClusterRole
metadata:
  name: pod-reader
rules:
  - apiGroups: [""]
    resources: ["pods"]
    verbs: ["get", "list"]
```

---

## 📌 Why Do We Need Both IAM + RBAC?

Because apps might need access to **both AWS services (outside)** and **Kubernetes resources (inside)**.

- **IAM Role** gives access to AWS (like Secrets Manager, S3, etc.)
- **RBAC Role/ClusterRole** gives access to Kubernetes (like creating Jobs, reading Logs, etc.)

The **ServiceAccount** is the **bridge** that connects both.

---

## 📦 Real YAML Structure Example (Simplified)

```yaml
# ServiceAccount linked to AWS IAM
apiVersion: v1
kind: ServiceAccount
metadata:
  name: employee-badge
  namespace: default
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::<account>:role/employee-badge-role

---
# ClusterRole for creating jobs
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: employee-badge-role
rules:
  - apiGroups: ["batch"]
    resources: ["jobs"]
    verbs: ["create", "delete", "get", "list"]

---
# Binding the role to the service account
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: employee-badge-binding
subjects:
  - kind: ServiceAccount
    name: employee-badge
    namespace: default
roleRef:
  kind: ClusterRole
  name: employee-badge-role
  apiGroup: rbac.authorization.k8s.io
```

---

## ✅ Final Summary

- RBAC is Kubernetes' **security system** — controlling **who** can do **what**.
- You need **IAM** for AWS permissions and **RBAC** for Kubernetes permissions.
- ServiceAccounts are the **glue** that connects both together.
- Use **Roles** for namespace-specific permissions, and **ClusterRoles** for full-cluster or global access.

---

🧠 Still confused? Just remember:

> The ServiceAccount is your badge.

> IAM gives access **outside** (AWS).

> RBAC gives access **inside** (Kubernetes).
