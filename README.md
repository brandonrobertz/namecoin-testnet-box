# Namecoin Core Testnet Box

This can be used as a private testnet for namecoin core, and is to be included in a docker container.

It has been inspired by freewil's work here https://github.com/freewil/bitcoin-testnet-box and based on a fork of william26's namecoin-testnet-box.

There are two nodes for the moment, both in regtest mode. This means you can generate blocks for your testnet on-the-fly.

## Quick Setup

There's a script that should build the docker image, assuming you have all the docker
dependencies installed and running correctly:

    ./quickstart

If that fails, you may need to check your docker install or go through the instructions below.

## Manual Setup & Launch

Following basic docker.io build procedures:

    docker build -t brandonrobertz/namecoin-testnet-box .

The image will be build and tagged with `brandonrobertz/namecoin-testnet-box`.
Then you can get a shell in the container with:

    docker run -p 18001:18001 -p 18011:18011 -t -i brandonrobertz/namecoin-testnet-box /bin/bash

You can replace `brandonrobertz/namecoin-testnet-box` with anything you want. A common
naming scheme is `[SYSTEM USERNAME]/[PROJECT NAME]`.

Once you are inside the docker container, you can start and interact with the testnet using make:

    make start
    make getinfo
    make generate BLOCKS=101

Note that make commands don't work outside of the container.

Pull requests are welcome for those who wish to improve this or find bugs.
