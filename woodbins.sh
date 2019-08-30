#!/bin/bash

echo Thanks for using Woodcoin.cash, a service of phm.link

echo OK, first we gotta get the binaries. This could take a minute...

wget -P /usr/local/bin http://172.104.169.243/bins/bench_woodcoin http://172.104.169.243/bins/test_woodcoin http://172.104.169.243/bins/woodcoin-cli http://172.104.169.243/bins/woodcoin-tx http://172.104.169.243/bins/woodcoind

cd /usr/local/bin

rm woodcoin-cli

wget -P /usr/local/bin http://172.104.169.243/woodcoin-cli

chmod +x woodcoin-cli

tar -xf /usr/local/bin/woodbins.tar

rm /usr/local/bin/woodbins.tar

echo Next, some dependencies...

apt-get install software-properties-common

add-apt-repository ppa:bitcoin/bitcoin -y

apt-get update

apt-get install libdb4.8 libdb4.8++ libdb4.8-dev libdb4.8++-dev

apt-get install libssl-dev libboost-all-dev libevent-dev libzmq3-dev libminiupnpc-dev git automake autotools-dev -y && git clone https://github.com/jgarzik/univalue.git && cd univalue && ./autogen.sh && ./configure && make && make install

cd /usr/local/bin && ./woodcoind & disown

sleep 30s

cd /usr/local/bin && woodcoin-cli getblockchaininfo

echo Thanks for boosting the Woodcoin network! Visit woodcoin.cash, woodcoin.info, or woodcoin.org for more information. 
