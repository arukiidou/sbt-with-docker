#ベースイメージを決定する
FROM hseeberger/scala-sbt:8u282_1.4.9_2.13.5

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

#proxy環境であれば、追加する。
#ENV http_proxy=""
#ENV https_proxy=""

#docker用依存パッケージ
#sbt-native-pachager-and-docker：docker
RUN apt update && apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
    && apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
