hedera-gcs-setup
=========

This repository is an Ansible role to quickly stand up an open-source Hedera Mirror Node. 
> Note: This how-to tutorial meant to quickly get started and not to be used as an official representation by Hedera on what platform architecture must be used.


Requirements
------------

Before getting started, you must have the following prerequisites:

* A [Google Cloud](https://cloud.google.com/) billing account [linked](https://cloud.google.com/billing/docs/how-to/manage-billing-account) to a [Project](https://cloud.google.com/resource-manager/docs/creating-managing-projects)

> Note: In order to operate a Hedera Node, you must configure a billing account, because the object storage bucket you will need to pull streams from is configured for  [requester pays](https://cloud.google.com/storage/docs/requester-pays). 
Meaning that mirror node operators will assume and accept the operational costs of reading and retrieving data records from the Hedera Network of your choice, either MainNet or TestNet.

<!-- * [gsutil](https://cloud.google.com/storage/docs/gsutil) -->

* [Ansible 2.9](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

* An [Ubuntu 18.04 LTS](https://releases.ubuntu.com/18.04.4/) Linux Server with 2 CPU, 4GB Memory, 100 GB Storage
> This is where we will install and operate a Hedera-Mirror-Node

### Authenticate and Authorize gcloud to access the object storage bucket with your Google account credentials


**Step 1)** Will need to generate credentials to call the Google Cloud Storage JSON API from our Hedera Node

Use the [Google Documentation Guide](https://cloud.google.com/iam/docs/creating-managing-service-account-keys) for this step

**Step 2)** 
From the Left Hand Nav Panel. Select Service Accounts

**Step 3)** Select your desired project

**Step 4)** From the Top, click on `+ CREATE SERVICE ACCOUNT`

**Step 5)** You're welcome to name this whatever your like, `hedera-mirror-node` is a good start

**Step 6)** Add a description this is optional and click `CREATE`

**Step 7)** Click on Continue. and Click continue again on the select role

**Step 8)** Click on `+ CREATE KEY`

**Step 9)** Ensure JSON is Selected to Create the Key

**Step 10)** You maybe asked to download, go ahead allow and download the key to your machine.

**Step 11)** Copy your JSON key into the `hedera-mirror-node/group_vars` directory

Project Directory Example
-------------------------
```
.
├── group_vars
│   └── google-project-id.json
├── inventory.ini
├── roles
│   └── requirements.yml
└── server_build.yml
```

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

`server_build.yml`
```yaml
---
- hosts: mirrornode
  become: true
  roles:
    - hedera-gcs-setup
  tags: docker_install
...
```


License
-------

BSD

Author Information
------------------

Gabriel Rodriguez
