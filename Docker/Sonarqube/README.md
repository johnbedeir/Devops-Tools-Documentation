# Running SonarQube with Docker on Linux

<img src=cover.jpg>

This README provides a step-by-step guide on how to run SonarQube using Docker on a Linux system and how to use SonarQube for code analysis.

## Prerequisites

- Docker installed on your Linux machine.
- Internet connection to download necessary files.

## Steps to Run SonarQube using Docker

1. **Start SonarQube Server**:
   Run the following command to start the SonarQube server in a Docker container:

   ```bash
   docker run -d --name sonarqube \
   -v sonarqube_data:/opt/sonarqube/data \
   -v sonarqube_extensions:/opt/sonarqube/extensions \
   -v sonarqube_logs:/opt/sonarqube/logs \
   -p 9999:9000 \
   sonarqube
   ```

This command will:

- Start a Docker container named `sonarqube`.
- Mount volumes for data, extensions, and logs.
- Map port 9999 on the host to port 9000 in the container.

2. **Download and Set Up Sonar-Scanner**:
   Follow these steps to download and set up Sonar-Scanner:

   - Download the Sonar-Scanner CLI:

     ```bash
     wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip
     ```

   - Unzip the downloaded file:

     ```bash
     unzip sonar-scanner-cli-4.8.0.2856-linux.zip
     ```

   - Move the unzipped folder to `/opt/sonar-scanner`:

     ```bash
     sudo mv sonar-scanner-cli-4.8.0.2856-linux.zip /opt/sonar-scanner
     ```

   - Create a symbolic link to the sonar-scanner binary:

     ```bash
     ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner
     ```

   - Add Sonar-Scanner to your PATH in `.bashrc` or `.zshrc`:
     ```bash
     export PATH="/usr/local/bin/sonar-scanner:$PATH"
     ```

## Using SonarQube

After setting up SonarQube and Sonar-Scanner, follow these steps to analyze your project:

1. **Access SonarQube Web Interface**:
   Open a web browser and go to `http://localhost:9999`.

2. **Login to SonarQube**:
   Use the default credentials (username: `admin`, password: `admin`) for the first-time login.

3. **Create a New Project**:
   Follow the on-screen instructions to create a new project.

4. **Local Analysis**:
   Choose to analyze your project locally when prompted.

5. **Generate a Token**:
   Generate an authentication token as per the instructions on the SonarQube interface.

6. **Run Sonar-Scanner**:
   Navigate to your project directory in the terminal and execute the following command, replacing `GENERATED_TOKEN` with your actual token:

   ```bash
   sonar-scanner \
   -Dsonar.projectKey=nodejs-postgres \
   -Dsonar.sources=. \
   -Dsonar.host.url=http://sonarqube.local.com:9999 \
   -Dsonar.login=GENERATED_TOKEN
   ```

   This command will start the analysis of your project.

7. **View Results**:
   Once the analysis is complete, you can view the results on your SonarQube project page.
