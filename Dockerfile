FROM flannon/circleci-centos7-core

MAINTAINER Flannon Jackson <flannon@5eight5.com>

# Install needed software and users
USER root
RUN yum install -y python2-pip && \
    yum -y update && yum clean all -y

ADD https://releases.hashicorp.com/packer/1.3.2/packer_1.3.2_linux_amd64.zip \
    /usr/local/bin  

RUN unzip /usr/local/bin/packer_1.3.2_linux_amd64.zip -d /usr/local/bin && \
    rm -f /usr/local/bin/packer_1.3.2_linux_amd64.zip

RUN mkdir /home/circleci/packer && \
    chown circleci: /home/circleci/packer && \
    pip install pip --upgrade && \
    pip install boto3  

USER circleci
