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


### Yubikey

My Yubikey 4 works for OTP because it is merely registering as a keyboard.

See the [GPG Section](#GPG) for details on how to get Yubikey working with GPG.

TODO: There is supposedly a way to use a Yubikey to login and out of Fedora.

### GPG

gpg and gpg2 seems to be installed by default. However, neither gpg nor gpg2 seems to be ready to work in my Yubikey using default packages.

Import the public key using either a keyserver or an exported, armored key: 

```bash
$ gpg2 --recv-keys 0xYOURKEYID
```

Trust your public key using executing the following:

```bash
$ gpg2 --edit-key <recipient>
```

Use the `trust` command to trust the imported public key with `Ultimate` trust. Then run the quit command. After inserting the Yubikey with the corresponding private key material, `$ gpg2 --card-statu` should indicate that the private key material is on the Yubikey.






There are tons of web pages about using Yubikeys with Fedora, but they all seem to suck ass. The only on that appears to be good is from [Fedora Magazine](https://fedoramagazine.org/using-the-yubikey4-with-fedora/), which references [this Fedora Yubikey page](https://github.com/fedora-infra/ssh-gpg-smartcard-config/blob/master/YubiKey.rst).





