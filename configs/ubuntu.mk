UBUNTU_BASE_URL := http://releases.ubuntu.com

ubuntu-16.04.2-server-amd64.iso:
	$(MAKE) .buildiso NAME=ubuntu IMAGE=$@ VERSION=xenial URL=$(UBUNTU_BASE_URL)/16.04/$@
