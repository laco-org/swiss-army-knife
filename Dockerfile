FROM ubuntu:19.10
RUN apt-get update && apt-get install -y \
    git \
    wget curl iputils-ping nmap dnsutils \
    python3 python3-pip \
    vim openjdk-11-jdk \
    postgresql-client-11

ENV KUBECTL_VERSION v1.17.3
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

ENV SCALA_VERSION 2.13
ENV KAFKA_VERSION 2.4.1
RUN curl -LO https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    mkdir /opt/kafka && \
    tar -zxvf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt/kafka

CMD ["tail", "-f", "/dev/null"]
