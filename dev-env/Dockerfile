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
    ## pip
    cd /tmp && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    ## kubectl 
    cd /bin && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    ## az
    pip install azure-cli 

ADD prep-dev-env-ssh.sh /root/prep-dev-env-ssh.sh
