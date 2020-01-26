output "jenkins-instance-ip" {
  value = "${modules.main-vpc.jenkins-ip}"
}