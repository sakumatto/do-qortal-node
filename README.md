# Running a Qortal Node on your MAC as you the user

[Qortal](https://qortal.org) is a blockchain network that is designed for created a more distributed internet. It does have a coin that is created via minting rather using a Proof of Work system like BitCoin.

This repository helps set up an instance for running the qortal "core" server on your MAC. Qortal Core is how someone is able to participate in the network and mint coin if desired.

## Getting Started

The essence of the setup is in the `qortal_bootstrap.sh`. This script handles the following:

1. Ensures the system has a working Java runtime for running Qortal Core.
1. Downloads Qortal Core
1. Downloads a bootstrap file (this helps the Qortal Core get synced with the rest of the network much faster).
1. Gives you additional option to download Qortal UI

The script will put all the necessary files in `/Users/username/qortal`.
You can use this one-liner to fetch the script and run it on your MAC

curl $(https://github.com/sakumatto/do-qortal-node/blob/master/qortal_bootstrap.sh)
curl -s https://raw.githubusercontent.com/sakumatto/do-qortal-node/master/qortal_bootstrap.sh > ~/qortal_bootstrap.sh
./qortal_bootstrap.sh

This script is ported and changed from Qortal user @elarson's original w/ thanks!
Pls note, the .sh file should be executable on your MAC, but if it isn't, then you can run this following commands:

´´´´
chomd +x qortal_bootstrap.sh
./qortal_bootstrap.sh
´´´´