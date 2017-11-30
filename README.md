Posts-n-Notes
===========

This somewhat of a blog.

## Fedora 27 configuration notes

- Install and configure IDE

```bash
$ sudo dnf install emacs emacs-goodies
```

```bash
$ cat << EOF >  ~/.emacs.d/init.el
(setq make-backup-files nil) ; stop creating dumbass backup~ files
EOF
```

- Install/configure [GPG and SSH using Yubikey or hardware token](/fedora-gpg-ssh-yubikey-notes.md)

- Install [Signal-Desktop](/fedora-signal-build-notes.md) (including npm and nodejs)



## Random helpful resources

- man gpg-agent, and specifically look at the SSH content
- [https://github.com/drduh/YubiKey-Guide](https://github.com/drduh/YubiKey-Guide)
- [https://github.com/herlo/ssh-gpg-smartcard-config/blob/master/YubiKey.rst](https://github.com/herlo/ssh-gpg-smartcard-config/blob/master/YubiKey.rst)
