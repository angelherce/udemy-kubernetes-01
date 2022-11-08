# INSTALL AWS CLIENT
# --------------------------------------------------------------------- #

# Install AWS CLI con PIP
# ---------------------------------------------- #

# 1- APT Update
sudo apt update

# 2- Install PIP in Ubuntu 22.04.1
sudo apt install python3-pip

# 3- Check PIP instalation
pip3 --version

# 4- Install
pip3 install -U awsCli

# 5- Check AWS CLI instalation
aws --version

# ---------------------------------------------- #



# Install AWS CLI sin PIP
# ---------------------------------------------- #

# 1- Install
sudo apt install awscli

# 2- Check AWS CLI instalation
aws --version

# ---------------------------------------------- #

# --------------------------------------------------------------------- #



# Configure IAM user in AWS CLI
# ---------------------------------------------- #

# Congigure user
aws configure

# 01- Establecemos el "AWS Access Key ID"
# 02- Establecemos el "AWS Secret Access Key"
# 03- Establecemos el "Default region name"
# 04- Establecemos el "Default output format" en none

# Check configuration
ls /home/indenaiten/.aws
cat /home/indenaiten/.aws/credentials
cat /home/indenaiten/.aws/config
aws sts get-caller-identity

# ---------------------------------------------- #



# Install eksctl in Ubuntu 22.04.2
# ---------------------------------------------- #

# https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html

# Download
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

# Install
sudo mv /tmp/eksctl /usr/local/bin

# Check instalation
eksctl version

# ---------------------------------------------- #