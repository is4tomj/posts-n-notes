Fedora 27 configuration notes
=============

## Install and configure IDE

```bash
$ sudo dnf install emacs emacs-goodies
```
_Note: Add the user to the "wheel" group for sudo privileges_

```bash
$ cat << EOF >  ~/.emacs.d/init.el
(setq make-backup-files nil) ; stop creating dumbass backup~ files
EOF
```

## Turn off Bluetooth, WIFI, and WWAN on Shutdown and Startup

```bash
$ sudo emacs -nw /etc/default/tlp
```

Make sure the following line is set to zero:
`RESTORE_DEVICE_STATE_ON_STARTUP=0`

Uncomment or add the following lines:
`DEVICES_TO_DISABLE_ON_STARTUP="bluetooth wifi wwan"`
`DEVICES_TO_DISABLE_ON_SHUTDOWN="bluetooth wifi wwan`

## Set a random MAC address for a NIC using NetworkManager's cli ("nmcli")

If the name of the wifi or wired connection is unknown or unclear, you can list the names using this command:

```bash
$ nmcli device wifi list
```

To make sure that you are configuring the connection for the intended network, run the following command:

```bash
$ nmcli connection show "<name of wifi or wired connection point>"
```

Set the connection to stable or random. "stable" will create a random MAC to connect to a network, but use the same MAC each time the NetworkManager connects to the network. "random" will always create a new random MAC every time a connection is made to the network.

```bash
$ nmcli connection modify "<name connection point>" wifi.clone-mac-address stable|random
```

Connect to the connection point

```bash
$ nmcli connection up "<name of connection point>"
```

See the [nmcli Reference Manual](https://developer.gnome.org/NetworkManager/stable/nmcli.html) for more info, and [this helpful blog](https://blogs.gnome.org/thaller/2016/08/26/mac-address-spoofing-in-networkmanager-1-4-0).


## Enable/Disable wifi card

Add the following to `.bashrc` to add commands to enable or disable wifi

```bash
alias disable-intenal-wifi="sudo ifconfig wlp2s0 down" # disable
alias enable-intenal-wifi="sudo ifconfig wlp2s0 up" # enable
```


### Crypto/Security stuff

- Install/configure [GPG and SSH using Yubikey or hardware token](gpg-ssh-yubikey-notes.md)

### Signal

- Install [Signal-Desktop](signal-build-notes.md) (including npm and nodejs)


## Permanantly disable touch screen

```bash
$ sudo emacs /usr/share/X11/xorg.conf.d/10-evdev.conf
```

add `Option "Ignore" "on"` in the `InputClass` for the touch screen.

## Useful commands

```bash
$ xdg-open # opens a file or URL in the user's preferred application

$ tail -n X ~/.bash_history # view the last X commands
```
