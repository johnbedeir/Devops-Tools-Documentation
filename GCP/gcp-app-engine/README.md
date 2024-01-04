# Deploying Flask App on GCP App Engine

<img src=cover.png>

This guide will walk you through the steps to deploy a Flask application, like the provided `main.py`, on Google Cloud Platform's App Engine.

## Prerequisites

- A Google Cloud Platform account.
- Google Cloud SDK installed on your local machine.

## Getting Started

1. **Rename Your Application File:**
   Ensure that your Flask application file is named `main.py`.

2. **App Engine Configuration File:**
   Create an `app.yaml` file in the same directory as your `main.py`. This file is used to configure your App Engine environment.

3. **Update Cloud SDK:**
   Run the following command to update all the installed components of the Google Cloud SDK to the latest version:

   ```
   gcloud components update
   ```

4. **Create a GCP Project:**
   If you haven't already, create a new project on Google Cloud Platform. Note down the `PROJECT_ID`.

5. **Enable App Engine Admin API:**
   Enable the App Engine Admin API for your project. This is required for deploying applications.

6. **Authenticate Your Account:**
   Authenticate your GCP account with the following command:

   ```
   gcloud auth login
   ```

7. **Set Project ID:**
   Configure `gcloud` to use your project with the following command:

   ```
   gcloud config set project PROJECT_ID
   ```

   Replace `PROJECT_ID` with your actual GCP project ID.

8. **Deploy the Application:**
   Navigate to your application directory where `main.py` and `app.yaml` are located. Run the following command to deploy your application:

   ```
   gcloud app deploy
   ```

   Follow the on-screen prompts to complete the deployment.

9. **Access Your Application:**
   Once the deployment is successful, you can access your application using the following command:
   ```
   gcloud app browse
   ```

## Additional Information

- Make sure you are in the correct directory where your `main.py` and `app.yaml` files are located before running the deployment commands.
- For more detailed information and troubleshooting, refer to the [Google Cloud App Engine Documentation](https://cloud.google.com/appengine/docs).

---
