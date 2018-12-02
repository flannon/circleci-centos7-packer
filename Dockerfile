FROM flannon/circleci-centos7-core

MAINTAINER Flannon Jackson <flannon@5eight5.com>

# Install needed software and users
USER root
RUN yum install -y centos-release-scl && \
    yum install -y python27 python27-python-pip python2-pip && \
    yum -y update && yum clean all -y

RUN wget -O packer.zip https://releases.hashicorp.com/packer/1.3.2/packer_1.3.2_linux_amd64.zip && \
    unzip packer.zip -d /usr/local/bin && \
    rm -f packer.zip && \
    mkdir /home/circleci/packer && \
    chown circleci: /home/circleci/packer && \
    scl_source enable python27 && \
    pip install pip --upgrade && \
    pip install boto3 && \
    echo "#!/bin/bash\nsource scl_source enable python27" \
    > /etc/profile.d/enablepython27.sh

USER circleci
