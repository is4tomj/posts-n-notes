
### OpenSC

Install the following:

```bash
$ sudo dnf install readline-devel openssl-devel libxslt docbook-style-xsl pcsc-lite-devel automake autoconf libtool gcc opensc
```

OpenSC will install several programs, such as pkcs11-switch, pkcs11-tool, pkcs15-crypt, pkcs15-init, pkcs15-tool.

### Notes for OpenSC

- Some [OpenSC documentation](https://github.com/OpenSC/OpenSC/wiki/Linux-Distributions).
- Build Instructions for [OpenSC ](https://github.com/OpenSC/OpenSC/wiki/Compiling-and-Installing-on-Unix-flavors).

### GPG

gpg and gpg2 seem to be installed by default. I still run the following:

```bash
$ sudo dnf install ykpers-devel libyubikey-devel libusb-devel yubikey-manager \
  autoconf gnupg gnupg2-smime pcsc-lite pcsc-lite-ccid 
```

I use the following [gpg.conf](/gpg.conf) and [gpg-agent.conf](/gpg-agent.conf).

Import the public key using either a keyserver or an exported, armored key: 

```bash
$ gpg2 --recv 0xKEYID
```

Trust your public key using executing the following:

```bash
$ gpg2 --edit-key <recipient>
```

Use the `trust` command to trust the imported public key with `Ultimate` trust. Then run the `quit` command. After inserting the Yubikey with the corresponding private key material, `$ gpg2 --card-status` should indicate that the private key material is on the Yubikey.


**Note:**
>There are tons of web pages about using Yubikeys with Fedora, but they all seem to suck ass. The only on that appears to be good is from [Fedora Magazine](https://fedoramagazine.org/using-the-yubikey4-with-fedora/), which references [this Fedora Yubikey page](https://github.com/fedora-infra/ssh-gpg-smartcard-config/blob/master/YubiKey.rst).

#### Touch

You should require touch for crypto operations on your Yubikey, as described [here](https://github.com/drduh/YubiKey-Guide#requiring-touch-to-authenticate).

#### SSH

Do not create a new SSH key-pair. Instead, do the following (assuming you have already [setup your Yubikey](https://github.com/drduh/YubiKey-Guide) to include your private key material with the standard three subkeys):

1. Add the following to your .bashrc file from the SSH section in `man gpg-agent`:

```bash
export GPG_TTY=$(tty)

if [ ! -f /tmp/gpg-agent.env ]; then

    GPGAGENTPID=$(pgrep gpg-agent)
    if [ $GPGAGENTPID -gt 0 ]; then
	echo "Killing gpg-agent."
	killall gpg-agent;
    fi
    
    eval $(gpg-agent --daemon --enable-ssh-support > /tmp/gpg-agent.env);
fi
. /tmp/gpg-agent.env


unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

echo "gpg-connect-agent updatestartuptty /bye: $(gpg-connect-agent updatestartuptty /bye)"

```

NOTE: Per man gpg-agent, in  case  the  gpg-agent  receives a signature request, the user might need to be prompted for a passphrase, which is necessary for decrypting the stored key.  Since  the ssh-agent  protocol  does  not  contain  a mechanism for telling the agent on which display/terminal it is running, gpg-agent's ssh-support will use the TTY or X display where gpg-agent  has  been  started.  To switch this display to the current one, the following command may be used:
`gpg-connect-agent updatestartuptty /bye`


2. Open a new terminal and run the following:
```bash
$ ssh-add -L
```

3. Copy the output ("ssh-rsa ... == cardno:00...").

4. Paste the output into your SSH keys on GitHub or into your `authorized_keys` file on whatever server you're trying to access.

**NOTE:**
> If you setup your Yubikey to require a touch before performing any cryptographic operation, then you will need to touch your Yubikey when you perform an ssh or scp operation (including git clone/pull/push on GitHub).
