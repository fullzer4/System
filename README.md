# dotFiles_ArchSway

My Arch Linux setup interface, files, and more! :)

<img src="./imgs/screenshot-2023-05-29-033143.png">

## Incial setup

1 - Create a bootable USB flash drive with the Arch ISO file (recommended tools: Rufus / balenaEtcher).
2 - Once you have the bootable USB drive ready, use the archinstall command to simplify your life during installation.

### Desktop:

If you are using a desktop environment with a wired network connection, you don't need to set up Wi-Fi, etc. Just skip to the next step.

### Notebook:

To set up our network, follow these steps:

```bash
  iwctl 
```

```bash
  device list
```

Replace "wlan0" and "WifiNetwork" with your specific parameters.

```bash
  station wlan0 connect WifiNetwork
```
After connecting, simply exit:

```bash
  exit
```

3 - After connecting to a network, we will install Arch Linux using archinstall:

```bash
  archinstall
```

### Preferred settings for my environment in the options:

In 'Drivers': is use ext4 format without /home partition

In 'Swap': False

In 'Root password': None

In 'Profile':

- desktop

- sway

- polkit

- ( chose your device )

In 'Kernels': linux-zen

In 'Additional packages': firefox git

In 'Network configuration': Use NetworkManager

In 'Optional repositories': multilib
