include configs/*.mk

GENISO ?= genisoimage -r -J -quiet -no-emul-boot -boot-load-size 4 \
            -boot-info-table -b isolinux/isolinux.bin -c isolinux/boot.cat

# .ONESHELL:
.buildiso:
ifndef IMAGE
	$(error IMAGE is undefined)
endif
ifndef NAME
	$(error NAME is undefined)
endif
ifndef VERSION
	$(error VERSION is undefined)
endif
ifndef URL
	$(error URL is undefined)
endif
	mkdir -p cache $@
	wget -O "cache/$(IMAGE)" -c $(URL)
	7z x -y "cache/$(IMAGE)" -o$@
	rsync -ruv provisioning configs/$(NAME)/common/ $@
	-rsync -ruv configs/$(NAME)/$(VERSION)/ $@
	(cd $@ && find -follow -type f -print0 | xargs --null md5sum > md5sum.txt)
	$(GENISO) -o $(IMAGE) $@
	rm -rf $@

clean:
	rm -vrf .buildiso *.iso

.PHONY: clean
