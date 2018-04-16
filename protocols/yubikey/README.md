Yubikey 4 Setup
=============

# Relevant Security Advisories

**Security Advisory 2017-10-16**: Be sure that you are not in the class of people that fall into this sad category of [poorly implemented crypto on smart cards](https://www.yubico.com/support/security-advisories/ysa-2017-01/) (including some Yubikeys). Avoid this mess by generating your keys using standard implementations, like GnuPG. See this [great drduh tutorial](https://github.com/drduh/YubiKey-Guide).

# Resources

- [Yubico PIV Tool Command Line Guide](https://www.yubico.com/wp-content/uploads/2016/05/Yubico_PIV_Tool_Command_Line_Guide_en.pdf)
- [YubiKey for yubicloud configuration guide](https://www.yubico.com/wp-content/uploads/2016/06/YubiKey_for_YubiCloud_ConfigGuide_en.pdf) Describes how to use the YubiKey Personalization Tool application to configure your YubiKey for Yubico OTP, and then upload the AES key to the Yubico validation server. You can then add your YubiKey to your supported service provider or application. When we ship the YubiKey, Configuration Slot 1 is already programmed for Yubico OTP and ready to use, and Configuration Slot 2 is not configured. Use this guide to overwrite Configuration Slot 1 or to configure Configuration Slot 2 as needed.
- Hardware token/Open SC tutorial [Code Signing and Verification with OpenSSL](https://eclipsesource.com/blogs/2016/09/07/tutorial-code-signing-and-verification-with-openssl/)
- [Yubikey - Code signing with a smart card](https://eclipsesource.com/blogs/2016/11/25/yubikey-code-signing-with-a-smart-card/)

# Use a Yubikey 4

A Yubikey 4 can be loaded with three 4096-bit subkeys for encryption, signing and authentication. The subkeys should be generated from a master private key that has never been on the same computer as the Smart Yass vault, and preferably generated on an air-gapped computer.

You should configure your Yubikey 4 with "touch for crypto operations", so that the Yubikey 4 will only perform a cryptographic operation in response to a touch. Although some Yubikey 4 features use a touch mechanism out of the box, this feature is ***not*** enabled out of the box. See Yubico's [tutorial](https://developers.yubico.com/PGP/Card_edit.html#_yubikey_4_touch) (scroll up a little after you select this link because the website UI sucks).

You can use [build-gpg-key-material.sh](./build-gpg-key-material.sh) to generate the master key-pair and subkeys. I will continue to update this over time to standardize the process of creating an encrypted backup, loading subkeys on a Yubikey 4, and configuring "touch for crypto operations." The script is tested on MacOS and Fedora. See this [great drduh tutorial](https://github.com/drduh/YubiKey-Guide) for instructions.

## Yubikey NEO

A Yubikey NEO is better than nothing, but if you must use a NEO, then you should be rigorous about removing your NEO from your computer immediately after you perform a crypto operation. Unlike Yubikey 4, Yubikey NEO does not have the "touch for crypto operations" feature. Accordingly, you should remove your Yubikey NEO when you are not using it for crypto operations or authentication.

Make sure that you have [upgraded your firmware](https://developers.yubico.com/ykneo-openpgp/SecurityAdvisory%202015-04-14.html). Otherwise, you should see if Magic Johnson or Equifax have any advice about recovering things that were unintentionally shared with total strangers.

# Setup of a new Yubikey

Download the `yubico-piv-tool`, `yubikey-personalization-gui` and while you're at it, the following packages.

```bash
$ sudo dnf install yubikey-personalization-gui yubico-piv-tool yubico-piv-tool-devel yubikey-manager yubioath-desktop readline-devel openssl-devel libxslt docbook-style-xsl pcsc-lite-devel automake autoconf libtool gcc opensc
```

**Note** that pcsc-lite-devel is a Fedora library, so you will have to the corresponding library for your OS.

## Everyone

*Reset all PIV data*
```bash
$ ykman piv reset
```

*Require touch*
```bash
$ ykman openpgp touch aut on
$ ykman openpgp touch enc on
$ ykman openpgp touch sig on
```

## OATH (like Google Auth or Authy) setup and use

You can use `yubioath-desktop` or continue to use `ykman`.

**Add**
```bash
$ ykman oath add --touch <name> <secret>
```
**Get OATH code**
```bash
$ ykman oath code <name>
```

## If you do not want to be tracked by Yubico
**Only if you don't want to use Yubico OTP**, which is the default for Configuration Slot 1. You can still use Yubico's OATH desktop application.

**Note:** To my knowledge, you must use linux to use the ykpersonalize cli; otherwise, you need to use the Yubico Personalization GUI.

*Remove any preset configuration slots* 
```bash
$ ykman slot delete 1
$ ykman slot delete 2
```

# Yubikey for Identification or Encryption

Using a Yubikey for two-factor authentication schemes is a much better experience than using a software token, such as Google Authenticator or Authy. With a Yubikey, you can simply plug it into a USB port and touch it to finish authenticating with a website; in contrast, a software token requires you to pull out your phone, open Google Authenticator or other authentication tool, and copy a six digit code into a browser to finish authenticating with a website.

In addition to authentication, a Yubikey can be used as a Personal Identity and Verification (PIV) card. A PIV card can be used to cryptographical/securely identify that a message was from the PIV card holder, or that a message encrypted with a particular public key can be decrypted by the PIV card holder.

A Yubikey can also be used for other cryptographic applications, such as an OpenPGP system. GnuPG, a program that implements OpenPGP protocol, supports Yubikeys out of the box. Some password managers, such as `pass`, use GnuPG to encrypt passwords on a local storage.


# YubiKey PIV certs/keys



# YubiKey for GnuPG and OpenPGP

Use [build-gpg-key-material.sh](build-gpg-key-material.sh) to generate key material.

If something goes wrong and you want to reset your PGP key material, pins, etc., then you can run [yubikey-gpg-reset.sh](yubikey-gpg-reset.sh). This cannot be undone so be sure you want to reset everything.

# YubiKeys and Linux

According to Yubico (see [this Post](https://developers.yubico.com/yubikey-personalization/USB-Hid-Issue.html)), YubiKeys can have a quirk with the usbhid module on Linux. The Post shows how to diagnose and fix the quirk.
```
