## Deploying Flask App on Google Cloud Run

<img src=cover.png>

### Prerequisites

- A Google Cloud Platform account.
- Google Cloud SDK installed on your local machine.
- Docker installed on your local machine (for building the container image).

### Steps

1. **Prepare Your Application:**

   - Ensure your Flask application is in a file named `main.py`.
   - Create a `requirements.txt` file in the same directory as your `main.py`, listing all the dependencies.

2. **Containerize Your Application:**

   - Create a `Dockerfile` in the same directory as your `main.py`. A basic example of a Dockerfile for a Flask application is:

3. **Build Your Container Image:**

   - Build the Docker image and tag it for uploading:
     ```
     docker build -t gcr.io/PROJECT_ID/my-flask-app .
     ```
   - Replace `PROJECT_ID` with your actual GCP project ID.

4. **Push Your Container Image to Container Registry:**

   - Push the image to Google Container Registry:
     ```
     docker push gcr.io/PROJECT_ID/my-flask-app
     ```

5. **Deploy on Cloud Run:**

   - Ensure you have set your GCP project ID:
     ```
     gcloud config set project PROJECT_ID
     ```
   - Deploy the image to Cloud Run:
     ```
     gcloud run deploy --image gcr.io/PROJECT_ID/my-flask-app --platform managed
     ```
   - Follow the prompts to specify the service name and region. Allow unauthenticated invocations if needed.

6. **Access Your Application:**
   - Once the deployment is successful, Cloud Run will provide a URL to access your application.

To remove or delete the deployment of your application from Google Cloud Run, you can follow these steps:

### Delete the Cloud Run Service

First, you'll need to delete the specific Cloud Run service where your application is deployed. You can do this using the Google Cloud Console or the `gcloud` command-line tool.

Using `gcloud`, the command to delete a service is:

```sh
gcloud run services delete SERVICE_NAME --platform managed
```

Replace `SERVICE_NAME` with the name of the service you want to delete.

This command will prompt you to confirm the deletion. Once confirmed, it will remove the service and stop serving your application.

### Remove the Container Image

If you also want to remove the container image from the Google Container Registry, you can do so through the Google Cloud Console or using `gcloud`:

```sh
gcloud container images delete gcr.io/PROJECT_ID/my-flask-app --force-delete-tags
```

Replace `PROJECT_ID` with your actual GCP project ID and `my-flask-app` with the name of your Docker image.

This command will delete the container image and its tags from your Container Registry.

### Delete the GCR Repository

```
gcloud container images list --repository=gcr.io/PROJECT_ID
```

### Notes

- Make sure you replace `PROJECT_ID` with your actual Google Cloud project ID in the commands.
- The first deployment might take a bit longer as it involves setting up the Cloud Run service.
- For more detailed information, refer to the [Google Cloud Run Documentation](https://cloud.google.com/run/docs).
