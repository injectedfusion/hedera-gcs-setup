# Hedera Mirror Node Object Storage Bucket Setup

This repository is provide an Ansible role to quickly stand up an open-source Hedera Mirror Node. 
> Note: This how-to tutorial meant to quickly get started and not to be used as an official representation by Hedera on what platform architecture must be used.

Hedera's Google Storage Bucket is configured for [requester pays](https://cloud.google.com/storage/docs/requester-pays). 
Meaning that that mirror node operators will assume and accept the operational costs of reading and retrieving data records from the Hedera Network of your choice, either MainNet or TestNet.

## Getting Started

These instructions will guide you on retrieving record streams from a Hedera Network via which are stored in Google Cloud storage buckets.

## Prerequisites

Before getting started, you must have the following prerequisites:

* A [Google Cloud](https://cloud.google.com/) billing account [linked](https://cloud.google.com/billing/docs/how-to/manage-billing-account) to a [Project](https://cloud.google.com/resource-manager/docs/creating-managing-projects)

> Note: You must ensure billing is defined and configured to your Project. For further instructions see the [Cloud Billing Documentation](https://cloud.google.com/storage/docs/using-requester-pays#gsutil_3).


* An [Ubuntu 18.04 LTS](https://releases.ubuntu.com/18.04.4/) Linux Server with 2 CPU, 4GB Memory, 100 GB Storage
* 

### Authenticate and Authorize gcloud to access the Cloud Platform with your Google user credentials



| Name                      | Default Value                     | Description                                 |
|---------------------------|---------------------------------  |---------------------------------------------|
| [YOUR_PROJECT_ID]         |                                   | Your Google Cloud Project Unique Identifier |
| [HEDERA_BUCKET_NAME]      | `hedera-mainnet-streams`          | Hedera's Google Cloud Storage Bucket Name   |
| [YOUR_OBJECT_DESTINATION] | `/var/lib/hedera-mirror-importer` | Location on where to store the file         |

Replace the text in **[Brackets]** with your Google Cloud Storage Account



## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.