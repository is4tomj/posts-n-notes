Identification + Anonymity
=================

## Goal

**Strong authentication and security while maintaining anonymity.**

## Warning

Security is not a state. Security is a journey. You will do something wrong the first time you try new protocol.

## Definitions

*Personally Identifying Information* (PII) is data that identifies a natural person, such that another can identify, deduce, or collect personal information about the natural person. For example, PII includes the IP address of a natural person's home.

A *hardware token* (HT) is a device that can be used for strong authentication and identification. A Yubikey is a HT.

A *software token* (ST) is a software-based method of authentication, such as an TOTP or HOTP-based authenticator like Google Authenticator or Authy.

## Rules

1. Never use your HT for an account or service that has your PII.

## Password managers

I want a password manager that is (1) portable, (2) uses asymmetric encryption of the stored data, and (3) requires a symmetric key to access the vault.

The best solution I have found so far is *Pass*. *Pass* is nice because it uses GnuPG to encrypt passwords. Furthermore, you can save files and notes in the vault. The two things I don't like about *Pass*:
- *Pass* uses GnuPG instead of OpenSSL to encrypt data and files.
- *Pass* does not have an encrypted vault, so account and file names in the clear.

I don't have a solution to the first issue at this time, but the second can be solved by encrypting a USB key with LUKS encryption ([example using LUKS](https://github.com/drduh/YubiKey-Guide#backup-everything)).

**Notes on Pass:** The default vault path is ~/.password-store. In a Pass vault, a file named `gpg-id` has a single line comprising the gpg2 key ID of the the public key that should be used to encrypt data. If you want to change the public key that is used to store data, then you can change the key ID in that file.

## Two-Factor Authentication

Two-factor authentication should always be required for any accounts that use a username/password credential for access management (almost everything).

I prefer to use an HT as a second factor authenticator, such as U2F with a Yubikey. Some browsers and websites do not support using a HT as a second factor authentication. In those situations, an ST must be used.

I hate most STs. The only authenticator I like is the [Yubico Authenticator (aka yubioath-desktop)](https://developers.yubico.com/yubioath-desktop/), which runs on the desktop and provides an HOTP if the correct HT is present. The Yubico Authenticator also runs on Android too.

According to the Yubico Authenticator website, the OATH secrets are stored on the Yubikey device so that you can get a TOTP or HOTP credential on any computer as long as you have your Yubikey.


## Backup of cryptographic material

## Email

Proton Mail

## Messaging

## Blogging

## File sharing

## Payment

