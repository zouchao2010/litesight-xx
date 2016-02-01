FROM node:0.10

ENV VERSION 0.2.1

WORKDIR /opt

RUN apt-get update \
    && apt-get install -y wget \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

#RUN touch /root/.npmrc \
#    && echo registry=https://registry.npm.taobao.org >> /root/.npmrc


#安装litecoind
RUN wget https://download.litecoin.org/litecoin-0.8.7.5/linux/litecoin-0.8.7.5-linux.tar.xz \
    && tar -xvf litecoin-0.8.7.5-linux.tar.xz \
    && ln -sfv /opt/litecoin-0.8.7.5-linux/bin/64/* /usr/local/bin \
    && rm -rf litecoin-0.8.7.5-linux.tar.xz

#install litesight
RUN git clone https://github.com/pembo210/Litesight.git \
    && mv Litesight litesight \
    && cd litesight \
    && npm install

WORKDIR /opt/litesight

ADD . /opt/litesight
RUN chmod 755 run.sh

EXPOSE 4001
CMD ["./run.sh"]
