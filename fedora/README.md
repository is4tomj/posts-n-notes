Fedora 27 and 28 configuration notes
=============

## Install and configure IDE (emacs)

```bash
$ sudo dnf install emacs emacs-goodies
```
_Note: Add the user to the "wheel" group for sudo privileges_

```bash
$ cat << EOF >  ~/.emacs.d/init.el
(setq make-backup-files nil) ; stop creating dumbass backup~ files
EOF
```

Update fedora's default editor to be emacs in window-less terminal mode by adding `export EDITOR="/usr/bin/emacs -nw"` to .bashrc.

See the following to add new packages to emacs: [http://ergoemacs.org/emacs/emacs_package_system.html](http://ergoemacs.org/emacs/emacs_package_system.html)

## Setup and check CPU heat sensors

```bash
$ sudo dnf install lm_sensors lm_sensors-sensord
$ watch -n 2 sensors
```

## Setup TLP

```bash
$ sudo dnf install tlp tlp-stat
```

To make sure things are running correctly, use the following command:

```bash
$ sudo tlp-stat -s
```

### Turn off Bluetooth, WIFI, and WWAN on Shutdown and Startup

```bash
$ sudo emacs -nw /etc/default/tlp
```

Make sure the following line is set to zero:
`RESTORE_DEVICE_STATE_ON_STARTUP=0`

Uncomment or add the following lines:
`DEVICES_TO_DISABLE_ON_STARTUP="bluetooth wifi wwan"`
`DEVICES_TO_DISABLE_ON_SHUTDOWN="bluetooth wifi wwan`

## Set a random MAC address for a NIC using NetworkManager's cli ("nmcli")

Set the global the wifi mac address to be random by default by creating a new config file named `/etc/NetworkManager/conf.d/30-mac-randomization.conf`:

```config
# Custom configuration file for NetworkManager.
# I named this 30-mac-randomization.conf so that other configurations
# can be sent before or after this, e.g.,29-[[filename]].

# More general details at https://developer.gnome.org/NetworkManager/stable/NetworkManager.conf.html#id-1.2.5.11

# The following configurations were discussed at https://blogs.gnome.org/thaller/2016/08/26/mac-address-spoofing-in-networkmanager-1-4-0/

[device-mac-randomization]
wifi.scan-rand-mac-address=yes

[connection-mac-randomization]
ethernet.cloned-mac-address=random
wifi.cloned-mac-address=random

```


If the name of the wifi or wired connection is unknown or unclear, you can list the names using this command:

```bash
$ nmcli device wifi list
```

Run the following to see all the wireless network that the NIC has connected to. This command gives more specific names for connections, such as "<SSID> num":

```bash
$ nmcli connection show
```

To make sure that you are configuring the connection for the intended network, run the following command:

```bash
$ nmcli connection show "<name of wifi or wired connection point>"
```

Set the connection to stable or random. "stable" will create a random MAC to connect to a network, but use the same MAC each time the NetworkManager connects to the network. "random" will always create a new random MAC every time a connection is made to the network.

```bash
$ nmcli connection modify "<name connection point>" wifi.cloned-mac-address stable|random
```

Connect to the connection point

```bash
$ nmcli connection up "<name of connection point>"
```

or

```bash
$ nmcli device wifi connect <SSID-name> password <password>
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
## Fix pcscd

After install Fedora 28, the following Fedora 27 fix does not work. The following command does appear to fix the issue. This is probably a better fix and would probably work in Fedora 27 too.

```bash
$ sudo systemctl restart pcscd
```


While using Fedora 27, gpg2 could not find my Yubikey 4. I would use the following fix, which seemed to resolve the problem.

> The following [script](resetUSB.sh) resets the USB ports when they don't seem to be working. The script is from [this](https://enc.com.au/2014/02/14/resetting-usb-devices/).



