# Student Marketplace Helm Deployment 

This repository contains the Helm charts and configurations to deploy the Student Marketplace application on a Kubernetes cluster using MicroK8s or any standard Kubernetes setup. The deployment includes frontend, backend, and PostgreSQL database components, along with ingress configuration.

## Features

Frontend: React/Vite application

Backend: Flask API with JWT authentication

Database: PostgreSQL StatefulSet with persistent storage

Ingress: Supports routing through Traefik

Dynamic configuration using values.yaml

## Prerequisites

Kubernetes cluster (e.g., MicroK8s, Minikube)

Helm 3 installed

Traefik ingress controller enabled

MetalLB for LoadBalancer support (MicroK8s)

## Helm Deployment

1. Deploy the application using the provided Helm chart:

```helm install student-marketplace ./helm-chart```

2. Upgrade deployment after changes:

```helm upgrade student-marketplace ./helm-chart```

3. Uninstall deployment:

```helm uninstall student-marketplace```
