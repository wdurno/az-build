FROM docker:dind

RUN apk --update --no-cache add \
        gcc \
        bash \
        ca-certificates \
        curl \
        openssl \
        python3-dev \
        libc-dev \
        libffi-dev \
        libressl-dev \
        musl-dev \
        make \
        gettext \
        git \
        vim \
        openjdk8 && \
    ## python <- python3
    cp /usr/bin/python3 /usr/bin/python && \
    ## pip
    cd /tmp && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    ## kubectl 
    cd /bin && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    ## helm 
    cd /tmp && \
    wget https://get.helm.sh/helm-v3.3.4-linux-amd64.tar.gz && \
    tar -zxvf helm-v3.3.4-linux-amd64.tar.gz && \
    cp linux-amd64/helm /usr/bin/helm && \
    ## az
    pip install azure-cli && \
    ## terraform 
    cd /tmp && \
    wget https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip && \
    unzip terraform_0.13.4_linux_amd64.zip && \
    mv terraform /usr/bin/terraform 

ADD prep-dev-env-ssh.sh /root/prep-dev-env-ssh.sh
