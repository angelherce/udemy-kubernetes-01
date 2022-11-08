# CONFIGURE IAM USER IN AWS CLIENT

aws configure

# 01- Establecemos el "AWS Access Key ID"
# 02- Establecemos el "AWS Secret Access Key"
# 03- Establecemos el "Default region name"
# 04- Establecemos el "Default output format" en none

ls /home/indenaiten/.aws
cat /home/indenaiten/.aws/credentials
cat /home/indenaiten/.aws/config

aws sts get-caller-identity