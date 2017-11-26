Posts-n-Notes
===========

This somewhat of a blog.

## Create new node projects that are not React apps

Add shit here.

## Fedora 27 install and configuration notes


### Configuring Emacs (the best IDE)

```bash
sudo dnf install emacs emacs-goodies
```

After installing emacs-goodies, a shload of packages for emacs will be installed.

### Signal

Signal is not available for Fedora yet.


### GPG

gpg and gpg2 seem to be installed by default. I still run the following:

```bash
$ sudo dnf install ykpers-devel libyubikey-devel libusb-devel yubikey-manager \
  autoconf gnupg gnupg2-smime pcsc-lite pcsc-lite-ccid 
```

I use the following [gpg.conf](/gpg.conf) and [gpg-agent.conf](/gpg-agent.conf).

Import the public key using either a keyserver or an exported, armored key: 

```bash
$ gpg2 --recv-keys 0xYOURKEYID
```

Trust your public key using executing the following:

```bash
$ gpg2 --edit-key <recipient>
```

Use the `trust` command to trust the imported public key with `Ultimate` trust. Then run the `quit` command. After inserting the Yubikey with the corresponding private key material, `$ gpg2 --card-status` should indicate that the private key material is on the Yubikey.

**Note:**
>There are tons of web pages about using Yubikeys with Fedora, but they all seem to suck ass. The only on that appears to be good is from [Fedora Magazine](https://fedoramagazine.org/using-the-yubikey4-with-fedora/), which references [this Fedora Yubikey page](https://github.com/fedora-infra/ssh-gpg-smartcard-config/blob/master/YubiKey.rst).

#### SSH

Do not create a new SSH key-pair. Instead, do the following (assuming you have already [setup your Yubikey](https://github.com/drduh/YubiKey-Guide) to include your private key material with the standard three subkeys):

1. Add the following to your .bashrc file from the SSH section in `man gpg-agent`:

```bash
export GPG_TTY=$(tty)
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
```

2. Open a new terminal and run the following:
```bash
$ ssh-add -L
```

3. Copy the output ("ssh-rsa ... == cardno:00...").

4. Paste the output into your SSH keys on GitHub or into your `authorized_keys` file on whatever server you're trying to access.

**NOTE:**
> If you setup your Yubikey to require a touch before performing any cryptographic operation, then you will need to touch your Yubikey when you perform an ssh or scp operation (including git clone/pull/push on GitHub).










#### Helpful resources

- man gpg-agent, and specifically look at the SSH content
- [https://github.com/drduh/YubiKey-Guide](https://github.com/drduh/YubiKey-Guide)
- [https://github.com/herlo/ssh-gpg-smartcard-config/blob/master/YubiKey.rst](https://github.com/herlo/ssh-gpg-smartcard-config/blob/master/YubiKey.rst)
