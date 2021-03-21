#ベースイメージを決定する
FROM hseeberger/scala-sbt:8u282_1.4.9_2.13.5

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

#proxy環境であれば、追加する。
#ENV http_proxy=""
#ENV https_proxy=""

#docker用依存パッケージ
#初期構築及びインフラデプロイ：docker
RUN apt update && apt install -y \
    sudo \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt update && apt install -y \
    containerd.io \
    docker-ce \
    docker-ce-cli \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
