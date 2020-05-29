#!/bin/bash
# Setup Script for hedera-gcs-setup

mkdir -pv hedera-mirror-node/vars hedera-mirror-node/roles
touch hedera-mirror-node/inventory.ini
cat >> hedera-mirror-node/inventory.ini <<- _EOF_
[mirrornode]
IPADDRESS ansible_ssh_user=USERNAME
_EOF_
touch hedera-mirror-node/roles/requirements.yml 
cat >> hedera-mirror-node/roles/requirements.yml <<- _EOF_
---
# from github
- src: https://github.com/injectedfusion/hedera-gcs-setup
...
_EOF_
touch hedera-mirror-node/vars/project-id.json
cat >> hedera-mirror-node/vars/project-id.json <<- _EOF_
{
  "access_key":"GOOG1E...",
  "secret_key":"H/4..."
}
_EOF_



