#ベースイメージを決定する
FROM hseeberger/scala-sbt:8u282_1.5.5_2.13.6

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
    gnupg \
    software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian buster stable"
RUN apt update && apt install -y \
    docker-ce=5:20.10.7~3-0~debian-buster \
    docker-ce-cli=5:20.10.7~3-0~debian-buster \
    containerd.io=1.4.6-1 \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
