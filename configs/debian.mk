debian-9.0.0-amd64-netinst.iso:
	$(MAKE) .buildiso NAME=debian IMAGE=$@ VERSION=stretch URL=https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/$@

debian-8.8.0-amd64-netinst.iso:
	$(MAKE) .buildiso NAME=debian IMAGE=$@ VERSION=jessie URL=https://cdimage.debian.org/cdimage/archive/8.8.0/amd64/iso-cd/$@
