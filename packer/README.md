# Using packer with Jenkins



Added plugins:
+   AnsiColor
+   GitHub plugin

### Dependencies
+   jenkins
+   virtualbox


```
vboxmanage controlvm packer-virtualbox-iso poweroff || true
vboxmanage unregistervm packer-virtualbox-iso --delete || true
rm -rf $WORKSPACE/packer/output-virtualbox-iso || true


if [ ! -d $WORKSPACE/bin ]; then
    mkdir $WORKSPACE/bin && cd $WORKSPACE/bin
    wget https://dl.bintray.com/mitchellh/packer/0.5.1_linux_amd64.zip
    unzip 0.5.1_linux_amd64.zip
fi

if [ -a $WORKSPACE/packer/packer_arch_virtualbox.box ]; then
    rm $WORKSPACE/packer/packer_arch_virtualbox.box
fi

cd $WORKSPACE/packer
$WORKSPACE/bin/packer build -only virtualbox-iso template.json
```
