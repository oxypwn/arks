#!/bin/bash
[[ $ARKS_TRACE ]] && $DEBUGVARS

_puppet_conf () {
cat > /etc/puppet/puppet.conf << EOF
[main]
logdir=/var/log/puppet
vardir=/var/lib/puppet
ssldir=/var/lib/puppet/ssl
rundir=/var/run/puppet
factpath=$vardir/lib/facter
templatedir=$confdir/templates
server=${PUPPET_SERVER}
EOF
}

_provision_puppet () {
    # install puppet
    _installpkg ruby
    _installaur ruby-hiera
    _installaur puppet
    # intall config
    mkdir /etc/puppet
    if [[ ! -z "${PUPPET_CONF}" ]]; then
        curl -fsL -o /etc/puppet/puppet.conf "${PUPPET_CONF}"
    else
        _puppet_conf
    fi
    systemctl enable puppet
}

if [[ ! -z "${PUPPET_SERVER}" ]]; then
        _provision_puppet
fi
