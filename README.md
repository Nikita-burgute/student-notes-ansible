
# Containerized Student Notes Sharing Website Using Docker and Kubernetes

## 1. Project Overview

The Student Notes Sharing Website is a simple web application that provides students with information about different programming and computer science subjects.

This project demonstrates containerization using Docker and deployment using Kubernetes.

## 2. Technologies Used

- HTML
- CSS
- Nginx
- Docker
- Kubernetes
- Minikube
- GitHub Codespaces

## 3. Application Features

The website displays four subjects:

- Java Programming
- Python Programming
- Database Management System
- Computer Networks

## 4. Project Structure

```text
student-notes-ansible/
│
├── website/
│   ├── index.html
│   └── style.css
│
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
│
├── Dockerfile
├── deploy.yml
├── inventory.ini
└── README.md
```

## 5. Docker Containerization

The application is packaged using a Dockerfile based on the lightweight Nginx Alpine image.

### Build Docker Image

```bash
docker build -t student-notes-app:v1 .
```

### Run Docker Container

```bash
docker run -d --name student-notes-container -p 8080:80 student-notes-app:v1
```

### Verify Container

```bash
docker ps
```

## 6. Kubernetes Deployment

The application is deployed on a Minikube Kubernetes cluster.

The Deployment configuration uses two replicas to run two application Pods.

### Load Docker Image into Minikube

```bash
minikube image load student-notes-app:v1
```

### Apply Deployment

```bash
kubectl apply -f k8s/deployment.yaml
```

### Apply Service

```bash
kubectl apply -f k8s/service.yaml
```

## 7. Verify Kubernetes Resources

### Check Pods

```bash
kubectl get pods
```

### Check Deployment

```bash
kubectl get deployments
```

### Check Services

```bash
kubectl get services
```

### Access Application

```bash
kubectl port-forward service/student-notes-service 8081:80 --address 0.0.0.0
```

Open the forwarded port 8081 in GitHub Codespaces to access the website.

## 8. Kubernetes Configuration

- Deployment: Manages two replicas of the website.
- Pods: Run the Nginx-based application containers.
- Service: Uses NodePort to expose the application on port 30080.
- Resource requests and limits: Configure CPU and memory allocation for containers.

## 9. Conclusion

This project successfully demonstrates how to build a Docker image, run a container, and deploy a web application using Kubernetes.

The application is accessible through a Kubernetes Service, and two Pods are maintained by the Deployment.

The project provides practical experience with Docker containerization and Kubernetes orchestration.
