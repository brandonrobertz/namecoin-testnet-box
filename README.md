hello
=======
# Namecoin Core Testnet Box

This can be used as a private testnet for namecoin core, and is to be included in a docker container.

It has been inspired by freewil's work here https://github.com/freewil/bitcoin-testnet-box and based on a fork of william26's namecoin-testnet-box.

There are two nodes for the moment, both in regtest mode. This means you can generate blocks for your testnet on-the-fly.

## Instructions

Following basic docker.io build procedures:

    docker build .

Then you can get a shell in the container with:

    docker run [DOCKER ID] /bin/bash
