# Using packer with Jenkins



Added plugins:
+   AnsiColor
+   GitHub plugin

### Dependencies
+   jenkins
+   virtualbox


```
VBNAME=packer-arks
NAME=arks
vboxmanage controlvm $VBNAME poweroff || true
vboxmanage unregistervm $VBNAME --delete || true
rm -rf $WORKSPACE/packer/output-$NAME || true
rm -rf /var/lib/jenkins/VirtualBox\ VMs/$VBNAME || true
PACKER=0.5.1_linux_amd64.zip

if [ ! -d $WORKSPACE/bin ]; then
mkdir $WORKSPACE/bin && cd $WORKSPACE/bin
wget https://dl.bintray.com/mitchellh/packer/$PACKER
unzip $PACKER
fi

if [ -a $WORKSPACE/packer/packer_arch_virtualbox.box ]; then
rm $WORKSPACE/packer/packer_arch_virtualbox.box
fi

cd $WORKSPACE/packer
$WORKSPACE/bin/packer build -only $NAME ./template.json
```
