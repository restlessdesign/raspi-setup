# raspi-setup

A small set of scripts to set up Raspberry Pi devices to a common configuration

## Installation

To configure preferences (WiFi, keyboard, etc.), first run:

```bash
$ sudo ./setup.sh
```

This script will trigger a reboot. After rebooting, run the update script\*
to get the latest firmware and packages:

```bash
$ cd ~/tmp/
$ sudo ./update.sh
```

\* — For the sake of convenience, this file will be moved to `~/tmp/update.sh` so that you may run the script from a remote machine.

## License

MIT
