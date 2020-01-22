data "template_file" "jenkins-init" {
  template = file("../modules/jenkins-instance/scripts/jenkins-init.sh")
  vars = {
    DEVICE            = var.INSTANCE_DEVICE_NAME
    JENKINS_VERSION   = var.JENKINS_VERSION
    TERRAFORM_VERSION = var.TERRAFORM_VERSION
  }
}

data "template_cloudinit_config" "cloudinit-jenkins" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.jenkins-init.rendered
  }
}

data "template_file" "jenkins-init-2" {
  template = file("../modules/jenkins-instance/scripts/jenkins-init-2.sh")
  vars = {
    DEVICE            = var.INSTANCE_DEVICE_NAME
    JENKINS_VERSION   = var.JENKINS_VERSION
    TERRAFORM_VERSION = var.TERRAFORM_VERSION
  }
}

data "template_cloudinit_config" "cloudinit-jenkins-2" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.jenkins-init-2.rendered
  }
}

