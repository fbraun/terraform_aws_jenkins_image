FROM debian:stable-slim
RUN apt-get update -y && apt-get install -y curl

## install kubernetes
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.9/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

## install latest docker
RUN cd /root && curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

# install helm 3
RUN curl -LO https://get.helm.sh/helm-v3.4.0-linux-amd64.tar.gz && tar -xvf ./helm-v3.4.0-linux-amd64.tar.gz && mv ./linux-amd64/helm /usr/local/bin/helm

RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        python3-setuptools \
        groff \
        less \
    && pip3 install --upgrade pip \
    && apt-get clean

RUN pip3 --no-cache-dir install --upgrade awscli

RUN aws --version

CMD ["/bin/bash", "-c", "ls -al"]
