# UDACITY CAPSTONE PROJECT
Capstone project for udacity Cloud DevOps Engineer

**The project repo is split into directories for simplicity**

>Docker
>infrastructure

## PROJECT STRUCTURE

**The Docker directory contains the CICD pipeline, apps and dockerfile to build a contanerised image for deployment.**

**The infrastructure directory contain the infrastructure codes, vpc, jenkins-instance, eks-cluster & worker deploy and security groups. Other items are the aim role, policy arn and many other files need to deploy the environment**

## Deployment process

The deployment is environment defined
dev:    _Development environment_
pro:    _Production environment_

Switch to appropriate directory for your environment
```
cd dev
terraform init
terraform apply
```
The environment will spin up

Get output details for login