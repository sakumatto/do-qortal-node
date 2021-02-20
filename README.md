# Running a Qortal Node on your MAC as you the user

This repository helps set up an instance for running the qortal "core" server on your MAC. [Qortal](https://qortal.org) Core is how someone is able to participate in the network and mint coin if so desiring.

## Getting Started

The essence of the setup is in the `qortal-bootstrap.sh`. This script handles the following:

1. Ensures the system has a working Java runtime for running Qortal Core.
1. Downloads Qortal Core
1. Downloads a bootstrap file (this helps the Qortal Core get synced with the rest of the network much faster).
1. Downloads the 1.4.1 version of jar file that is presently the recommended one
1. Gives you additional option to download Qortal UI

The script will put all the necessary files in `/Users/username/qortal`.
You can use this one-liner to fetch the script and run it on your MAC. Enter the command in Terminal.app (to be found in your Utilities, Cmd-Shift-U while in Finder).

```
curl -s https://raw.githubusercontent.com/sakumatto/do-qortal-node/master/qortal-bootstrap.sh > ~/qortal-bootstrap.sh
```

Pls note, the .sh file should be executable on your MAC, but if it isn't, then you can run this following command first (to make it executable):

```
chmod +x qortal-bootstrap.sh
```
You can then execute the script:

```
./qortal-bootstrap.sh
```

This script is ported and changed from Qortal user @elarson's original w/ thanks!