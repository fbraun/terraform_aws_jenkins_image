FROM debian:stable-slim
RUN apt-get update -y && apt-get install -y curl

## install kubernetes
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.9/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

## install latest docker
RUN cd /root && curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

# install helm 3
RUN curl -LO https://get.helm.sh/helm-v3.4.0-linux-amd64.tar.gz && tar -xvf ./helm-v3.4.0-linux-amd64.tar.gz && mv ./linux-amd64/helm /usr/local/bin/helm

# install terraform
ENV TERRAFORM_VERSION=0.14.3

RUN apt-get install unzip
RUN curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip 
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip 
RUN mv terraform /usr/local/bin/
RUN terraform --version 

# RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
# RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
# RUN apt-get update && sudo apt-get install terraform

#install AWS CLI

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

# RUN apt-get update && \
#     apt-get install -y \
#         python3 \
#         python3-pip \
#         python3-setuptools \
#         groff \
#         less \
#     && pip3 install --upgrade pip \
#     && apt-get clean

# RUN pip3 --no-cache-dir install --upgrade awscli

RUN aws --version

CMD ["/bin/bash", "-c", "ls -al"]
