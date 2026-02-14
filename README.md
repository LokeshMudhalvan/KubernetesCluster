# KubernetesCluster

## Overview
This project demonstrates the design and implementation of a self-managed Kubernetes cluster with a focus on networking, ingress, and TLS. The cluster is built to host real applications with external access, HTTPS termination, and production-style separation of concerns. All core infrastructure components are deployed declaratively and managed through Helm and Kubernetes-native resources.

---

## Cluster Components

### Helm
Application and infrastructure components are deployed using Helm, enabling repeatable installs, version control, and simplified configuration management across the cluster.

### MetalLB
The cluster runs on infrastructure without a cloud provider load balancer, so MetalLB is used to provide external IP addresses for Kubernetes `LoadBalancer` services. This allows ingress controllers and other services to be exposed outside the cluster in a cloud-agnostic manner.

### Traefik
Traefik is deployed as the ingress controller to manage incoming HTTP and HTTPS traffic. It routes requests to internal services using Kubernetes-native configuration and Traefik CRDs, providing flexible and explicit traffic routing.

### cert-manager
TLS certificates are fully automated using cert-manager. Certificates are issued via a ClusterIssuer and automatically renewed, allowing applications to be securely exposed over HTTPS without manual certificate management.

### Keycloak
Keycloak is deployed to provide centralized authentication and authorization for applications running in the cluster. It supports industry-standard protocols such as OAuth 2.0, OpenID Connect, and SAML, enabling secure single sign-on (SSO) and identity federation. Integrated with Traefik via OIDC, Keycloak enforces access control at the ingress or application layer, allowing services to rely on a shared identity provider rather than implementing custom authentication logic. This setup simplifies user management, improves security consistency across services, and enables role- and realm-based access control within the Kubernetes environment

---

## Traffic Flow
1. External traffic enters the cluster through a MetalLB-assigned external IP.
2. Traffic is received by Traefik via a `LoadBalancer` service.
3. Traefik routes requests to backend services using Ingress or IngressRoute rules.
4. cert-manager provisions and renews TLS certificates used by Traefik for HTTPS termination.
5. Requests are forwarded to application pods running inside the cluster.

---

## Key Design Goals
- Cloud-provider-independent load balancing
- Declarative and reproducible infrastructure
- HTTPS-by-default application exposure
- Clear separation between networking, ingress, and application layers
- Production-oriented Kubernetes design patterns

---

## Current Status
- Kubernetes cluster initialized and running
- Helm-based deployments configured
- MetalLB providing external service exposure
- Traefik ingress controller operational
- cert-manager issuing and managing TLS certificates
- Applications accessible over HTTPS
- Keycloak OIDC login
- Observability with Prometheus and Grafana
- Usage of Terraform to configure Keycloak

---

## Future Improvements
- Implement NetworkPolicies for improved security
- Enable horizontal pod autoscaling
- Add CI/CD for manifest and Helm chart validation
- Document failure scenarios and recovery behavior

---

## Project Motivation
This project showcases practical Kubernetes cluster design by focusing not only on running workloads, but also on the supporting infrastructure required to operate applications securely and reliably in real-world environments.
