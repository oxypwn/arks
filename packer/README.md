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


if [ -a $WORKSPACE/packer/packer_arch_virtualbox.box ]; then
rm $WORKSPACE/packer/packer_arch_virtualbox.box
fi

cd $WORKSPACE/packer
$(which packer) build -only $NAME ./template.json
```
