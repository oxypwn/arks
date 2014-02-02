.PHONY: all default cleanup

default: cleanup  build


cleanup:
	rm packer_arch_vmware.box ; rm packer_arch_virtualbox.box || true

build:
	packer build -only virtualbox-iso template.json
