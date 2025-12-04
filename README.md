# Azure Infrastructure Automation with Terraform & Ansible

## 🚀 Overview  
UNIR-2 is an infrastructure-as-code (IaC) project that uses Terraform and Ansible to automate the provisioning, configuration, and deployment of cloud infrastructure and applications — enabling reproducible and scalable environments with minimal manual effort.

## Description  
- `terraform/` — Terraform configurations for resource provisioning (e.g. Azure resources).  
- `ansible/` — Ansible playbooks and roles for configuring VMs & deploying containers.  
- `.gitignore`, `.gitattributes` — Standard repository config.  

## Features & Purpose  
- Automatically provision cloud infrastructure (e.g. registry, VMs, Kubernetes cluster) in the cloud provider.  
- Configure virtual machines and deploy containerized applications (e.g. via Podman + Nginx).  
- Prepare a Kubernetes environment with persistent storage and load-balancing for application deployment.  
- Manage permissions and authentication seamlessly to allow Kubernetes to pull container images from private registries.  
- Provide a clear, repeatable, and automated workflow for infrastructure + application deployment.

## Requirements & Prerequisites  
Ensure you have installed:  
- Terraform (version compatible with the configuration).  
- Ansible (and necessary modules/collections).  
- Access credentials for the cloud provider (e.g. Azure) with permissions to create resources, manage registries, VMs, Kubernetes clusters.  
- Podman or compatible container runtime (if deploying via containers on VMs).

## 📥 Installation & Setup (local / first-time)  

```bash
# 1. Clone the repository
git clone https://github.com/juanjomalouu/UNIR-2.git
cd UNIR-2

# 2. Initialize & apply Terraform to set up infrastructure
cd terraform
terraform init
terraform apply

# 3. (Optional) Review output variables / credentials — configure environment variables if needed.

# 4. Use Ansible to configure and deploy applications
cd ../ansible
ansible-playbook -i inventory main.yml
