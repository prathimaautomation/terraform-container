FROM python:3.8.6

RUN apt-get update && apt-get install -y jq \
    && apt-get install -y git \
	&& pip install awscli \
	&& pip install boto3

RUN \
# Update
apt-get update -y && \
# Install Unzip
apt-get install unzip -y && \
# need wget
apt-get install wget -y && \
# vim
apt-get install vim -y

# Install Terraform

# Download terraform for linux
RUN wget https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip

# Unzip
RUN unzip terraform_0.11.11_linux_amd64.zip

# Move to local bin
RUN mv terraform /usr/local/bin/
# Check that it's installed
RUN terraform --version

CMD ["/bin/bash"]
