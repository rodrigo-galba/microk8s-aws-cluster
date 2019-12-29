# MicroK8s cluster on AWS

This project deploy a Kubernetes cluster using MicroK8s to install Kubernetes, on AWS EC2 instances, created using Terraform.

## Tech stack

- MicroK8s
- Terraform
- Kubernetes

## Usage

### Pre-requisites

- AWS_ACCESS_KEY 
- AWS_SECRET_KEY
- An existing key pair named `cloud-dev-instance`.

```sh
terraform init
$ terraform plan
...
Plan: 3 to add, 0 to change, 0 to destroy.
```