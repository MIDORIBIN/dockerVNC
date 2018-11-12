FROM consol/ubuntu-xfce-vnc

USER 0

# japan apt server
RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list

# install app
RUN apt-get update && \
      apt-get -y install language-pack-ja fonts-vlgothic

# set japanese
RUN export LANG=ja_JP.UTF-8

ENV VNC_RESOLUTION=1324x768

RUN apt-get install -y \
      wget \
      curl \
      net-tools \
      nano \
      git

# Java8
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y oracle-java8-installer


# Install Intellij
RUN mkdir /opt/intellij && \
    wget -qO- "https://download-cf.jetbrains.com/idea/ideaIC-2018.1.5.tar.gz" | tar -zx --strip-components=1 -C /opt/intellij
