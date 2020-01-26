# UDACITY CAPSTONE PROJECT
Capstone project for udacity Cloud DevOps Engineer

**The project repo is split into directories for simplicity**

>Root folder with Dockerfile, Jenkinsfile ...
>infrastructure
>eks
>test

## PROJECT STRUCTURE

### infrastructure directory:
The infrastructure directory contain the infrastructure codes, vpc, jenkins-instance, eks-cluster & worker deploy and security groups. Other items are the aim role, policy arn and many other files need to deploy the environment.

## Deployment process
The deployment is environment defined
dev:    _Development environment_
pro:    _Production environment_

Switch to appropriate directory for your environment
```
cd infrastructure/dev/
```
desploy infrastructure with the command below
```
terraform init
terraform apply
```
***The environment will spin up***

## Configure kubectl
**terraform output kubeconfig and config-map-auth to be passed into files for authentication to cluster**
```
***terraform output kubeconfig > ~/.kube/config***
terraform output config-map-aws-auth > config-map-aws-auth.yaml
```

### Configure Jenkins 
```
sudo mkdir -p /var/lib/jenkins/.kube
sudo cp ~/.kube/config /var/lib/jenkins/.kube/
cd /var/lib/jenkins/.kube/
sudo chown jenkins:jenkins config
sudo chmod 750 config
```

## See nodes coming up
```
kubectl get nodes
```

## Destroy
To make sure all the resources created by Kubernetes are removed (LoadBalancers, Security groups), and issue:
```
terraform destroy
```