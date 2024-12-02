# DevOps Project: CI/CD with Jenkins, Docker, and GitHub

## Overview
This repository demonstrates the use of **DevOps tools** to implement Continuous Integration (CI) and Continuous Deployment (CD) for a Python application. The pipeline is automated using **Jenkins** and **Docker**, ensuring smooth deployment from development to production.

The project contains:
- A **Jenkinsfile** to define the CI/CD pipeline.
- A **Dockerfile** to containerize the Python application.
- Shell scripts to deploy and manage the application.
- A **GitHub Actions workflow** for an alternate CI/CD option.
- Configuration files for the application and pipeline settings.

---

## Setup Instructions

### 1. Clone the Repository
Clone the repository to your local machine using the following command:
```bash
git clone https://github.com/your-username/project-repo.git
cd project-repo
```

### 2.Install Dependencies
Ensure Python 3.9 and Docker are installed. If using Docker, make sure it's running.

Install Python dependencies:
```pip install -r requirements.txt```

### 3. Docker Setup
```docker build -t your-docker-hub-username/my-python-app .
```

### 4. Run the App
```docker run -d --name my-python-app -p 5000:5000 your-docker-hub-username/my-python-app
```

### 5. Jenkins Setup
Jenkins Pipeline
The Jenkinsfile defines a multi-stage pipeline that includes:
Cloning the repository
Installing dependencies inside a Docker container
Running unit tests with pytest
Building the Docker image for the application
Pushing the image to Docker Hub
Deploying the application using the deploy.sh script
Configuration:
DOCKER_REGISTRY: Update the Docker Hub username in the Jenkinsfile to your own.
docker-credentials: Add Docker Hub credentials to Jenkins using Jenkins' credential manager.
To create a new Jenkins pipeline:

Go to your Jenkins dashboard.
Create a new Pipeline job.
In the Pipeline section, select Pipeline script from SCM.
Enter your Git repository URL and branch name.
Save and run the pipeline.
### 6. GitHub Actions (Alternative CI/CD)
The .github/workflows/ci-cd.yml file defines an alternative GitHub Actions pipeline, which can be used instead of Jenkins:

This workflow runs on push events to the main branch.
It installs Python dependencies, runs tests, builds a Docker image, and deploys the application.
Update Docker credentials in GitHub Secrets (DOCKER_USERNAME and DOCKER_PASSWORD) for Docker login.
### 7. Shell Scripts
start.sh: Installs dependencies and starts the Python application.
deploy.sh: Deploys the Docker container to the server, pulling the latest image from Docker Hub.
clean.sh: Removes unused Docker containers and images.
Run the deployment script manually or as part of the Jenkins pipeline:

```
./scripts/deploy.sh
```
### Configuration Files

app_config.yml

This file contains application-level configuration, such as environment settings and database credentials.

```
app:
  name: My Python Application
  version: 1.0.0
  port: 5000
  environment: production

database:
  host: localhost
  port: 5432
  username: admin
  password: secret_password
pipeline_config.yml
```
This file contains pipeline-related configurations, such as Docker image settings and deployment configurations.

```
pipeline:
  build:
    image: python:3.9
    dependencies:
      - pytest
      - Flask
  test:
    framework: pytest
    coverage: true
  deploy:
    docker_registry: your-docker-hub-username
    container_name: my-python-app
    exposed_port: 5000
```
### Deployment

To deploy the application:

Build the Docker image (if not done already).
Run the deploy.sh script to deploy the app in the Docker container.
Alternatively, the application is automatically deployed as part of the Jenkins pipeline.

### Notes
This project assumes that you have Docker and Jenkins set up on your system. If you don't have them installed, please follow their official documentation to set them up.
The repository is configured to push images to Docker Hub. Make sure to replace the username in the Jenkinsfile with your Docker Hub username and configure credentials for Docker login.
If using GitHub Actions, ensure to set up Docker Hub secrets in your GitHub repository for automatic Docker login.
### Conclusion
This project demonstrates the key aspects of DevOps: automating the build, test, and deployment process using tools like Jenkins, Docker, and GitHub Actions. It shows how to create an efficient CI/CD pipeline and containerized deployment flow.

