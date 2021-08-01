# sbt-with-docker
build sbt-scala imege with docker
for sbt-native-packager 

# base-image
hseeberger/scala-sbt
https://hub.docker.com/r/hseeberger/scala-sbt

# additional-package
    sudo \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    containerd.io \
    docker-ce \
    docker-ce-cli \

# Gitlab-runner(sbt-native-packager 1.8.1) Example

```YAML:gitlab-ci.yml
nativepack:
  image: arukiidou/scala-sbt-docker:8u282_1.5.5_2.13.6_20.10.7
    # 定番のscala-sbtイメージにdockerだけ追加したもの
    # docker executor 使用可能
  stage: nativepack
  when: manual
  tags:
    # linux、またはwindowsに直接installしたgitlab-runnerで起動すること。
    - docker-windows
  services:
    # docker-runner内でdocker buildを実行する場合は、dindが必要。パッケージレジストリが非TLSならばさらにinsecureを設定する。
    - name: docker:20.10.7-dind
      command: ["--insecure-registry", "***.***.***.***:5050"]
  script:
    - service docker start # windowsまたはlinuxホストのdockerが開始している状態にすること
    - docker login $CI_REGISTRY -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD
    - >-
      sbt
      docker:publish
  artifacts:
    paths:
     - target/docker
    expire_in: 7d
```
