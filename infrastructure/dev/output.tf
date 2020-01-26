output "kubeconfig" {
  value = "${module.main-vpc.kubeconfig}"
}

output "config-map-aws-auth" {
  value = "${module.main-vpc.config-map-aws-auth}"
}

output "jenkins-ip" {
  value = "modules/jenkins-ip"
}