#!/bin/bash
# Setup Script for hedera-gcs-setup

mkdir -pv ~/Desktop/hedera-mirror-node/vars ~/Desktop/hedera-mirror-node/roles
touch ~/Desktop/hedera-mirror-node/inventory.ini
cat >> ~/Desktop/hedera-mirror-node/inventory.ini <<- _EOF_
[mirrornode]
IPADDRESS ansible_ssh_user=USERNAME
_EOF_
touch ~/Desktop/hedera-mirror-node/roles/requirements.yml 
cat >> ~/Desktop/hedera-mirror-node/roles/requirements.yml <<- _EOF_
---
# from github
- src: https://github.com/injectedfusion/hedera-gcs-setup
...
_EOF_
touch ~/Desktop/hedera-mirror-node/vars/project-id.json
cat >> ~/Desktop/hedera-mirror-node/vars/project-id.json <<- _EOF_
{
  "access_key":"GOOG1E...",
  "secret_key":"H/4..."
}
_EOF_
touch ~/Desktop/hedera-mirror-node/server_build.yml
cat >> ~/Desktop/hedera-mirror-node/server_build.yml <<- _EOF_
---
- hosts: mirrornode
  vars_files:
    - ./vars/project-id.json
  roles:
    - hedera-gcs-setup
...
_EOF_

# Install Ansible Role
ansible-galaxy install -r ~/Desktop/hedera-mirror-node/roles/requirements.yml --force

touch ~/Desktop/hedera-mirror-node/install_services.sh
cat >> ~/Desktop/hedera-mirror-node/install_services.sh  <<- _EOF_
#!/bin/bash
ansible-playbook -i  ~/Desktop/hedera-mirror-node/inventory.ini  ~/Desktop/hedera-mirror-node/server_build.yml --tags "install"
_EOF_

touch ~/Desktop/hedera-mirror-node/start_services.sh
cat >> ~/Desktop/hedera-mirror-node/start_services.sh  <<- _EOF_
#!/bin/bash
ansible-playbook -i ~/Desktop/hedera-mirror-node/inventory.ini ~/Desktop/hedera-mirror-node/server_build.yml --tags "start_services"
_EOF_

touch ~/Desktop/hedera-mirror-node/stop_services.sh
cat >> ~/Desktop/hedera-mirror-node/stop_services.sh  <<- _EOF_
#!/bin/bash
ansible-playbook -i ~/Desktop/hedera-mirror-node/inventory.ini ~/Desktop/hedera-mirror-node/server_build.yml --tags "stop_services"
_EOF_

chmod +x ~/Desktop/hedera-mirror-node/install_services.sh
chmod +x ~/Desktop/hedera-mirror-node/start_services.sh
chmod +x ~/Desktop/hedera-mirror-node/stop_services.sh

echo "Project Directory Established"
echo "Now go update hedera-mirror-node/inventory.ini and hedera-mirror-node/vars/project-id.json"