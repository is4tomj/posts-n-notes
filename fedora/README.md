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
$ sudo 

Make sure the following line is set to zero:
`RESTORE_DEVICE_STATE_ON_STARTUP=0`

Uncomment or add the following lines:
`DEVICES_TO_DISABLE_ON_STARTUP="bluetooth wifi wwan"`
`DEVICES_TO_DISABLE_ON_SHUTDOWN="bluetooth wifi wwan`

### Crypto/Security stuff

- Install/configure [GPG and SSH using Yubikey or hardware token](gpg-ssh-yubikey-notes.md)

### Signal

- Install [Signal-Desktop](signal-build-notes.md) (including npm and nodejs)


## Permanantly disable touch screen

```bash
$ sudo emacs /usr/share/X11/xorg.conf.d/10-evdev.conf
```

add `Option "Ignore" "on"` in the `InputClass` for the touch screen.