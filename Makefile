NAMECOIND=namecoind
NAMECOINGUI=namecoin-qt
NAMECOINCLI=namecoin-cli
B1_FLAGS=
B2_FLAGS=
B1=-datadir=1 $(B1_FLAGS)
B2=-datadir=2 $(B2_FLAGS)
BLOCKS=1
ADDRESS=
AMOUNT=
ACCOUNT=

start:
	$(NAMECOIND) $(B1) -daemon
	$(NAMECOIND) $(B2) -daemon

start-gui:
	$(NAMECOINGUI) $(B1) &
	$(NAMECOINGUI) $(B2) &

generate:
	$(NAMECOINCLI) $(B1) generate $(BLOCKS)

getinfo:
	$(NAMECOINCLI) $(B1) getinfo
	$(NAMECOINCLI) $(B2) getinfo

send:
	$(NAMECOINCLI) $(B1) sendtoaddress $(ADDRESS) $(AMOUNT)

address:
	$(NAMECOINCLI) $(B1) getnewaddress $(ACCOUNT)

stop:
	$(NAMECOINCLI) $(B1) stop
	$(NAMECOINCLI) $(B2) stop

clean:
	find 1/regtest/* -not -name 'server.*' -delete
	find 2/regtest/* -not -name 'server.*' -delete
