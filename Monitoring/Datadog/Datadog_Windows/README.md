# Running Datadog Agent on Windows

<img src=../../../icons/datadog.png width=150px> &nbsp;&nbsp;&nbsp; <img src=../../../icons/windows.png width=150px>

This guide will walk you through the steps to run the Datadog Agent on a Windows machine, and subsequently view the collected metrics on a Datadog dashboard.

## Prerequisites

1. An active Datadog account. If you don't have one, sign up [here](https://www.datadoghq.com/).
2. A Windows machine (Server or Workstation).

## Step-by-Step Guide

### 1. Install the Datadog Agent on Windows

1. **Download the Installer**:

   - Log in to your Datadog account.
   - Navigate to **Agent** > **Windows**.
   - Download the appropriate Datadog Agent installer based on your Windows version.

2. **Install the Datadog Agent**:

   - Run the installer as an administrator.
   - Follow the installation prompts.
   - During installation, you'll be asked for your Datadog API key. You can find this key in your Datadog dashboard under **Integrations** > **APIs**.

<img src=1.png width=400px> &nbsp; <img src=2.png width=400px>
<img src=3.png width=400px> &nbsp; <img src=4.png width=400px>

3. **Start the Datadog Agent**:
   - After installation, the Datadog Agent will start running as a service on your Windows machine. You can manage the Datadog Agent service via the `Services` application in Windows.

<img src=5.png width=700px>

### 2. (Optional) Configure Agent to Collect System Metrics

By default, the Datadog Agent will collect basic system metrics like CPU usage, memory, and disk I/O. However, if you want to collect additional metrics:

1. Navigate to the Datadog Agent configuration directory, typically `C:\ProgramData\Datadog`.
2. Edit the `datadog.yaml` file using a text editor.
3. Uncomment or add any specific configurations based on the metrics you wish to collect.
4. Save the file and restart the Datadog Agent service for the changes to take effect.

### 3. View the Datadog Dashboard

1. **Access the Datadog Dashboard**:

   - Log in to your Datadog account.
   - From the left navigation pane, click on **Dashboards**.

2. **Choose a Pre-configured Dashboard**:

   - Datadog provides several out-of-the-box dashboards. For Windows metrics, you will find the name of the machine in the dashboard list.

3. (Optional) **Customize a Dashboard**:
   - If you want to personalize your dashboard:
     - Click on the **New Dashboard** button.
     - Add widgets and select the metrics or events you're interested in.
     - Customize the visualization, timeframe, and layout as desired.
     - Save the dashboard for future reference.

<img src=6.png width=600px>

### 4. (Optional) Explore and Set Alerts

1. While viewing your dashboard, you can set alerts for specific metrics or events by clicking on the bell icon.
2. Define your alert criteria, message, and where you'd like to be notified (e.g., email, Slack, etc.).
3. Save the alert, and Datadog will notify you when the specified criteria are met.

<img src=7.png width=800px>

## Wrapping Up

You've successfully installed the Datadog Agent on your Windows machine, and you can now monitor and visualize your system's performance through the Datadog dashboard.

### 5. (Optional) Load Testing

Run some commands on the Windows machine and view the changes in the dashboard.

**Open the PowerShell as an administrator and run the following:**

**1. This will add some load on the CPU.**

```
$loop = [scriptblock]::Create("while ($true) {}")
Start-Job -ScriptBlock $loop
```

<img src=8.png width=800px>

---

**2. This will add some load on the Memory.**

```
$memArray = @()
while ($true) {
    $memArray += new-object byte[] 10MB
    Start-Sleep -Seconds 2
}
```

<img src=9.png width=800px>

**`NOTE: Make sure your machine specs can handle those requests otherwise the machine might not be able to work properly`**

---

**Note**: Always refer to [Datadog's official documentation](https://docs.datadoghq.com/) for the most up-to-date information and best practices.
