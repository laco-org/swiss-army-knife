FROM ubuntu:19.10
RUN apt-get update && apt-get install -y \
    wget curl iputils-ping \python3-minimal nmap dnsutils vim

ENV KUBECTL_VERSION v1.17.3
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

CMD ["tail", "-f", "/dev/null"]
