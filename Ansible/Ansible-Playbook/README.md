# Ansible-Playbook

[Watch Ansible Playbook and Docker شرح step by step on YouTube](https://youtu.be/-86oMSw6pSc)

This Playbook file is used to automate building docker image, since we are using a lot of commands to build, remove, and push images also to stop, remove and run containers so this file contains all the commands that you are going to use while testing building, pushing an image and run container.

**The file should do the following:**

1. Stop the current running container if exist
2. Remove the stopped container if exist
3. Remove the built image if exist
4. Build a new image from the Dockerfile
5. Create a tag to the image
6. Push the new built image to Dockerhub
7. Run a container from the new built image

So as you see this file is idempotent file that can run miltiple times without changing the output plus you can use only one image name and one container name so you don't get lost by the number of images and names that you are going to build with different names.
