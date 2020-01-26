output "jenkins-instance-ip" {
  value = "${modules.main-vpc.jenkins-ip}"
}
module "main-vpc" {
  source     = "../modules/vpc"
}