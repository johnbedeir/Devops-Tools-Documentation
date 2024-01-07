# Datadog Agent Setup on Ubuntu

<img src=../../../icons/datadog.png width=160px> &nbsp; &nbsp; &nbsp; <img src=../../../icons/ubuntu.png width=180px>

This README provides step-by-step instructions on how to set up the Datadog agent on an Ubuntu machine and view the metrics dashboard.

🎥 For a detailed walkthrough into this project, check out my video on YouTube: [HERE](https://youtu.be/vSL9y29yYQ4).

## Prerequisites

- An Ubuntu machine.
- A Datadog account. If you don't have one, sign up [here](https://www.datadoghq.com/).

## Steps

### 1. Install the Datadog Agent

Follow the instructions after login to your datadog account as you see in the following image:

`NOTE: If you already have a datadog account you can create an API key to use it for authentication with different datadog agents.`

<img src=1.png width=600px>

### 2. Start the Datadog Agent

<img src=2.png width=600px>

Once started you will see the following:

<img src=3.png width=600px>

### 3. Accessing the Datadog Dashboard

1. Navigate to the Datadog [dashboard login page](https://app.datadoghq.com/account/login).
2. Log in with your Datadog account credentials.
3. Once logged in, click on the "Dashboards" link in the left sidebar.
4. Select `All Hosts` to see the `Ubuntu Dashboard` and view metrics from your machine.

### 4. Observe Changes in Metrics

Now, will run process on the Ubuntu machine to monitor the changes, for example:

```
sudo apt upgrade -y
```

<img src=4.png width=600px>

#### `This will stress the CPU, Memory, Disk I/O and the Network`

<img src=5.png width=600px>
<img src=6.png width=600px>
<img src=7.png width=600px>

## Conclusion

You've now successfully set up the Datadog agent on Ubuntu and accessed the metrics dashboard.

<img src=8.png width=600px>
