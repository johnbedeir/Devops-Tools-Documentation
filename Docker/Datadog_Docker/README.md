# Datadog Agent Setup with Docker

<img src=../../icons/datadog.png width=160px> &nbsp; &nbsp; &nbsp; <img src=../../icons/docker.png width=180px>

This README provides step-by-step instructions on how to set up the Datadog agent with Docker and view the metrics dashboard.

## Prerequisites

- Install [Docker](https://docs.docker.com/get-docker/).
- A Datadog account. If you don't have one, sign up [here](https://www.datadoghq.com/).

## Steps

### 1. Install the Datadog Agent

If you already have Datadog account navigate to `Integration/Agent` on the left panel and choose `Docker`

You can create an API key to use it for authentication with different datadog agents.

`NOTE: For the first time you can choose Docker as you see in the followign image:`

<img src=1.png width=600px>

### 2. Creating Datadog Dashboard

1. Navigate to the Datadog [dashboard login page](https://app.datadoghq.com/account/login).
2. Log in with your Datadog account credentials.
3. Once logged in, click on the "Dashboards" link in the left sidebar.
4. Select `New Dashboard` to create your own one and view metrics from Docker.
5. Give it a name and select `New Dashboard`

<img src=2.png width=600px>

### 3. Adding Dashboard Widgets

1.  Click on `Add Widgets`

    <img src=3.png width=600px>

2.  Choose your preferred dashboard widget from the right sidebar.

    <img src=4.png width=300px>

3.  Choose the metrics that you want to display

    <img src=5.png width=600px>

In the following example I have used to collect metrics for:

1. Number of Stopped Containers
2. Number of Running Containers
3. Docker CPU Usage
4. Containers Memory Usage
5. Docker Network Recieved Packets
6. Docker Network Sent Packets

<img src=6.png width=800px>

### 4. Observe Changes in Metrics

Now, will spinup some more containers to monitor the changes for example (Grafana, Jenkins, Nginx, Nextcloud, SonarQube, Minikube, etc.)

<img src=7.png width=600px>

#### `This will increase the CPU, Memory,and the Network send and receive metrics`

<img src=8.png width=800px>

## Conclusion

You've now successfully set up the Datadog agent using Docker and accessed the metrics with your customized dashboard.

<img src=9.png width=800px>
