FROM python:3.8.6

RUN apt-get update && apt-get install -y jq \
	&& pip install -y awscli \
	&& apt-get install -y git \
	&& pip install ldap3 retrying -q \
	&& pip install boto3 -q \
	&& pip install requests -q

# Install Terraform

# Download terraform for linux
RUN curl -s "https://releases.hashicorp.com/terraform/1.0.2/terraform_1.0.2_linux_amd64.zip" -o terraform_1.0.2_linux_amd64.zip

# Unzip & Move to local bin
RUN unzip -q terraform_1.0.2_linux_amd64.zip -d /usr/local/bin

# Check that it's installed
RUN terraform --version

CMD ["/bin/bash"]
