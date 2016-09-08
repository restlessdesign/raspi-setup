![MIT License](https://img.shields.io/npm/l/git-js.svg)
[![Twitter](https://img.shields.io/badge/Twitter-@restlessdesign-gray.svg?style=flat)](https://twitter.com/restlessdesign)

# raspi-setup

A small set of scripts to set up Raspberry Pi devices to a common configuration

## Installation

To configure preferences (WiFi, keyboard, etc.), first run:

```bash
$ sudo ./bootstrap.sh
```

This script will trigger a reboot. After rebooting, run the setup script\*
to get the latest firmware, install default packages, and add a new user:

```bash
$ cd ~/tmp/
$ sudo ./scripts/setup.sh
```

\* — For the sake of convenience, this file will be moved to `~/tmp/scripts/setup.sh` so that you may run the script from a remote machine.

## License

MIT
