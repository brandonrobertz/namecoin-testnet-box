# namecoin-testnet-box docker image
#
# This image uses an "easy-mining" branch of namecoind to make new blocks occur 
# more frequently while mining with `make generate-true`
# 
# Forked from Sean Lavine's bicoin-testnet-box
# https://github.com/freewil/bitcoin-testnet-box
#

FROM ubuntu:14.04
MAINTAINER brandon robertz <brandon@bxroberts.org>

# add bitcoind from the official PPA
RUN apt-get update
RUN apt-get install --yes software-properties-common
RUN add-apt-repository --yes ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install --yes autoconf build-essential libssl-dev libboost-all-dev db4.8 libglibmm-2.4-dev git
RUN apt-get install --yes libtool autotools-dev pkg-config libevent-dev

# create a non-root user
#RUN adduser --disabled-login tester
RUN useradd -m -U tester

# run following commands from user's home directory
WORKDIR /home/tester

RUN git clone https://github.com/namecoin/namecoin-core.git
RUN cd namecoin-core && ./autogen.sh && ./configure --disable-tests && make

# install bitcoind
RUN cp namecoin-core/src/namecoind /usr/local/bin/
RUN cp namecoin-core/src/namecoin-cli /usr/local/bin/

# copy the testnet-box files into the image
ADD . /home/tester/namecoin-testnet-box

# make tester user own the bitcoin-testnet-box
RUN chown -R tester:tester /home/tester/namecoin-testnet-box

# use the tester user when running the image
USER tester

# run commands from inside the testnet-box directory
WORKDIR /home/tester/namecoin-testnet-box

# expose two rpc ports for the nodes to allow outside container access
EXPOSE 19001 19011
CMD ["/bin/bash"]
