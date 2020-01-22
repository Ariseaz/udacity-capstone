resource "aws_instance" "jenkins-instance-2" {
  ami           = "ami-02df9ea15c1778c9c"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.jenkins-securitygroup.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  # user data
  user_data = data.template_cloudinit_config.cloudinit-jenkins-2.rendered
}

resource "aws_ebs_volume" "jenkins-data-2" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "jenkins-data-2"
  }
}

resource "aws_volume_attachment" "jenkins-data-attachment-2" {
  device_name  = var.INSTANCE_DEVICE_NAME
  volume_id    = aws_ebs_volume.jenkins-data-2.id
  instance_id  = aws_instance.jenkins-instance-2.id
  skip_destroy = true
}

