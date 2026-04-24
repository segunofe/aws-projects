This repository contains Five (5) aws projects
1. Containerization of a nest application using Docker
2. Deployment to Amazon ECS
3. Deployment to Amazon EKS
4. Development of Terraform Module for AWS Infrastructure provisioning
   The modules are in another repository. The configuration files in the folder called "terraform-module" made reference to the modules for use.
   Here is the repo for the modules: https://github.com/segunofe/modules.git
5. Development of CI/CD pipeline using GitHub Actions to automate and speed up deployment of an eCommerce application

### For Project 5, I built a fully automated CI/CD Pipeline using GitHub Actions and Terraform Modules in AWS
<img width="1600" height="795" alt="image" src="https://github.com/user-attachments/assets/25e6a19a-89cd-4a09-8c4b-24dd92115ae9" />


https://www.linkedin.com/feed/update/urn:li:activity:7453378469041770497/
<img width="2181" height="1309" alt="ECSArchiDiagram drawio" src="https://github.com/user-attachments/assets/e89a3588-fa3e-4c64-a0d5-98fc7adfaa23" />
<img width="4050" height="4700" alt="cicd" src="https://github.com/user-attachments/assets/1f18caf7-95a1-44d9-85a2-a90ab05b2bac" />


This project demonstrates the design and implementation of a fully automated, CI/CD pipeline for deploying containerized applications on AWS using modern DevOps practices.

It focuses not just on tooling, but on solving real business problems such as deployment delays, downtime, security risks, and operational inefficiencies.

### 📌 Overview

The pipeline automates the entire software delivery lifecycle:

- Infrastructure provisioning
- Application containerization
- Security scanning
- Continuous deployment
- Monitoring and rollback
- Real-time notifications
  
### 🧱 Architecture Components
- Infrastructure as Code: Terraform
- Containerization: Docker
- Container Registry: Amazon ECR
- Orchestration: Amazon ECS
- Security Scanning: Trivy
- CI/CD Automation: GitHub Actions
- Notifications: Slack API

### ⚙️ Key Features & Business Impact

### 1. Automated AWS Infrastructure Provisioning (Terraform)

Problem: Manual infrastructure setup is slow and error-prone

Solution: Modular Terraform configurations for automated provisioning
<img width="1698" height="879" alt="Screenshot 2026-03-29 193047" src="https://github.com/user-attachments/assets/ff49b770-56d6-47f4-856d-d24af5596d44" />

✅ Impact:

Faster deployments (minutes instead of hours)
Reduced configuration errors
Lower operational costs

### 2. Containerized Application (Docker)

Problem: Inconsistent environments causing deployment failures
Solution: Lightweight, portable containers

<img width="1884" height="418" alt="Screenshot 2026-03-29 170815" src="https://github.com/user-attachments/assets/ff688c9a-a01a-4757-9176-66e0569f6a45" />

✅ Impact:

Environment consistency across dev/staging/prod
Faster and predictable deployments
Simplified scaling

### 3. Security Scanning with Trivy 🔐

Problem: Undetected vulnerabilities can lead to security breaches in production environment 
Solution: Automated scanning for High & Critical vulnerabilities

✅ Impact:

Detect security risks before deployment to production
Improved compliance

<img width="1629" height="810" alt="Screenshot 2026-03-29 193450" src="https://github.com/user-attachments/assets/2bc34c57-48f2-4072-a63a-b4c965a0a368" />

### 4. Amazon ECR (Container Registry)

Problem: Poor image management and lack of version control
Solution: Secure, centralized image repository

<img width="1892" height="537" alt="Screenshot 2026-03-29 215526" src="https://github.com/user-attachments/assets/70cf5744-2ab0-4507-9052-0461c2d4defe" />


✅ Impact:

Version-controlled deployments
Improved traceability
Secure artifact storage

### 5. Deployment on Amazon ECS

Problem: Complex container orchestration and scaling
Solution: Managed container orchestration

✅ Impact:

High availability and scalability
Reduced infrastructure management overhead
Reliable service delivery

### 6. Application Health Checks

Problem: Failed deployments go unnoticed
Solution: Automated health validation post-deployment

✅ Impact:

Early failure detection
Improved uptime
Better user experience

### 7. Automated Rollback Mechanism 🔄

Problem: Failed releases cause downtime and revenue loss
Solution: Instant rollback to last stable version

<img width="1879" height="404" alt="Screenshot 2026-03-29 173553" src="https://github.com/user-attachments/assets/43efe05f-89cf-498b-be9f-b00d675eebde" />


✅ Impact:

Zero downtime
Faster incident recovery
Protection of business revenue

### 8. Slack Notifications Integration

Problem: Slow response to deployment issues
Solution: Real-time deployment alerts via Slack

<img width="1398" height="499" alt="Screenshot 2026-03-29 193236" src="https://github.com/user-attachments/assets/ad676c11-353a-4ed8-89ae-e80e26bf885b" />


✅ Impact:

Faster incident response
Improved team visibility
Reduced Mean Time to Recovery (MTTR)

<img width="1657" height="1085" alt="Screenshot 2026-03-25 224602" src="https://github.com/user-attachments/assets/6ca79e9f-a928-46d8-9086-297accba2f23" />

### 📊 Business Value Summary

### This pipeline is designed to:

🚀 Accelerate Time-to-Market – Faster feature delivery
🛡️ Reduce Risk – Security scanning 
⚡ Improve Reliability – Health checks and automated rollback
💰 Optimize Costs – Less manual intervention and downtime

### 🔄 CI/CD Workflow
- Developer pushes code to GitHub
- GitHub Actions triggers pipeline
- Docker image is built
- Trivy scans image for vulnerabilities
- Image is pushed to Amazon ECR
- Application is deployed to Amazon ECS
- Health checks validate deployment
- If failure → automatic rollback
- Slack notification sent (success/failure)


📬 Contact

For questions or collaboration, reach out via LinkedIn: https://www.linkedin.com/in/segunofe/
