#!/usr/bin/env bash
# enables ssh for mitchellh/packer
cat > /etc/sudoers << EOF
root ALL=(ALL) ALL
%wheel ALL=(ALL) NOPASSWD: ALL
EOF


# Set root password for vagrant
passwd<<EOF
vagrant
vagrant
EOF

# Setup vagrant user
useradd -m -G wheel -r vagrant
su vagrant -l -c "curl -s ssh.keychain.io/vagrant.insecure.key@gmail.com/install | bash"

# Set root password for vagrant
passwd vagrant<<EOF
vagrant
vagrant
EOF

systemctl start sshd
