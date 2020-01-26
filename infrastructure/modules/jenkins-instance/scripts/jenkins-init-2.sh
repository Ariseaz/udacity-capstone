#!/bin/bash

# volume setup
vgchange -ay

DEVICE_FS=`blkid -o value -s TYPE ${DEVICE}`
if [ "`echo -n $DEVICE_FS`" == "" ] ; then 
  # wait for the device to be attached
  DEVICENAME=`echo "${DEVICE}" | awk -F '/' '{print $3}'`
  DEVICEEXISTS=''
  while [[ -z $DEVICEEXISTS ]]; do
    echo "checking $DEVICENAME"
    DEVICEEXISTS=`lsblk |grep "$DEVICENAME" |wc -l`
    if [[ $DEVICEEXISTS != "1" ]]; then
      sleep 15
    fi
  done
  pvcreate ${DEVICE}
  vgcreate data ${DEVICE}
  lvcreate --name volume1 -l 100%FREE data
  mkfs.ext4 /dev/data/volume1
fi
mkdir -p /var/lib/jenkins
echo '/dev/data/volume1 /var/lib/jenkins ext4 defaults 0 0' >> /etc/fstab
mount /var/lib/jenkins

# install nginx for reverse proxy
wget http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key
apt-get update -y
apt-get install nginx -y
systemctl start nginx
systemctl enable nginx


# jenkins repository
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb http://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list
apt-get update -y

# install dependencies
apt-get install -y python3 openjdk-8-jre
update-java-alternatives --set java-1.8.0-openjdk-amd64
# install jenkins
apt-get install -y jenkins unzip git
usermod -a -G root jenkins
systemctl start jenkins.service
systemctl enable jenkins.service

# install pip
wget -q https://bootstrap.pypa.io/get-pip.py
apt install python-pip
pip install --upgrade pip
pip install pylint

# Create python virtualenv & source it
# source ~/.devops/bin/activate
apt-get install python3-venv -y
python3 -m venv ~/.devops
source ~/.devops/bin/activate

# install docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt list --upgradable
sudo apt-get install -y docker-ce
usermod -aG docker ubuntu
docker pull hadolint/hadolint
usermod -a -G docker jenkins
systemctl restart jenkins
systemctl restart docker

# install node
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
apt-get install nodejs
npm install -g dockerlint



# install awscli
pip install awscli

# install terraform
wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
&& unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
&& rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# make install
apt install make
apt install make-guile -y

# install packer
cd /usr/local/bin
wget -q https://releases.hashicorp.com/packer/0.10.2/packer_0.10.2_linux_amd64.zip
unzip packer_0.10.2_linux_amd64.zip

# install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin

# install heptio-authenticator-aws
wget https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.3.0/heptio-authenticator-aws_0.3.0_linux_amd64
chmod +x heptio-authenticator-aws_0.3.0_linux_amd64
sudo mv heptio-authenticator-aws_0.3.0_linux_amd64 /usr/local/bin/heptio-authenticator-aws

# clean up
apt-get clean
rm terraform_0.7.7_linux_amd64.zip
rm packer_0.10.2_linux_amd64.zip

