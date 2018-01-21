#!/usr/bin/bash

set -euo pipefail
#set -euxo pipefail # to debug, uncomment this line, and comment out above line


######################
# Helpers
######################

# Generate random password of length n
# usage $(rpass n)
rpass() {
    tr -dc 'A-Za-z0-9_!@#$%^&*()\-+=' < /dev/urandom | head -c $1
}

############################
# Init directory and supporting documents
############################

# create and change to tmp folder
export GNUPGHOME=$(mktemp -d) ; echo "Created new tmp directory: ${GNUPGHOME}"
cd $GNUPGHOME

# create gpg.conf for key gen

cat << EOF > $GNUPGHOME/gpg.conf
use-agent
personal-cipher-preferences AES256 AES192 AES CAST5
personal-digest-preferences SHA512 SHA384 SHA256 SHA224
default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed
cert-digest-algo SHA512
s2k-digest-algo SHA512
s2k-cipher-algo AES256
charset utf-8
fixed-list-mode
no-comments
no-emit-version
keyid-format 0xlong
list-options show-uid-validity
verify-options show-uid-validity
with-fingerprint
EOF

# parameters for gpg
read -p "Recipient name: " NAME
read -p "Recipient Email: " EMAIL
echo

export PASSPHRASE=$(rpass 64)

GPGKEYGENPARAMS=$GNUPGHOME/gpg-key-gen.params

cat << EOF > $GPGKEYGENPARAMS
%echo Generating RSA 4096 key-pair
Key-Type: RSA
Key-Length: 4096

# Passphrase
%echo Passphrase is ${PASSPHRASE}
Passphrase: ${PASSPHRASE}

# Key identifying data
Name-Real: ${NAME}
Name-Email: ${EMAIL}

# No expiration if 0
Expire-Date: 0

# Do a commit here, so that we can later print "done" :-)
%commit
# %dry-run
%echo done
EOF


############################
# Run GPG commands
############################

GPG=gpg2

$GPG --batch --full-generate-key $GPGKEYGENPARAMS

$GPG --list-secret-keys "${EMAIL}"

read -p "Copy/paste key fingerprint here: " FPR
echo

echo $PASSPHRASE | xclip -i -r # primary (middle click) buffer
echo $PASSPHRASE | xclip -selection c -r # clipboard
echo "Copied passphrase into clipboard for the next commands."
echo

echo "Building rsa4096 sign subkey."
$GPG --quick-add-key "${FPR}" rsa4096 sign
echo

echo "Building rsa4096 auth subkey."
$GPG --quick-add-key "${FPR}" rsa4096 auth
echo

echo "Building rsa4096 encr subkey."
$GPG --quick-add-key "${FPR}" rsa4096 encr
echo


ARMOREDPUBLICKEY=$GNUPGHOME/${EMAIL}-armored-pubkey.txt
ARMOREDPRIVATEKEY=$GNUPGHOME/${EMAIL}-armored-privkey.txt
ARMOREDSUBKEYS=$GNUPGHOME/${EMAIL}-armored-subkeys.txt
PASSPHRASEFILE=$GNUPGHOME/${EMAIL}-passphrase.txt
echo "Exporting public key."
$GPG --armor --export $EMAIL > $ARMOREDPUBLICKEY
echo
echo "Exporting (symmetrically encrypted) secret key."
$GPG --armor --export-secret-keys $EMAIL > $ARMOREDPRIVATEKEY
echo
echo "Exporting subkeys."
$GPG --armor --export-secret-subkeys $EMAIL > $ARMOREDSUBKEYS
echo
echo "Exporting passphrase."
echo $PASSPHRASE > $PASSPHRASEFILE
echo

echo
echo "Good news:"
echo "  -Created primary key-pair and subkeys for ${EMAIL}."
echo "  -Exported public key to ${ARMOREDPUBLICKEY}."
echo "  -Exported private key to ${ARMOREDPRIVATEKEY}."
echo "  -Exported subkeys to ${ARMOREDSUBKEYS}."
echo "  -Saved passphrase for private key in ${PASSPHRASEFILE}."
echo
echo "TODO:"
echo "  -If needed, create encrypted backup of ${GNUPGHOME} (passphrase, key-pair, subkeys, etc)."
echo '  -Insert Harware Token ("HT").'
echo '  -Configure HT and add subkeys using "${GPG} --card-edit".'
echo "  -Secure delete all key material and remaining byproducts at ${GNUPGHOME}."
echo '  -If needed, delete master private key using "${GPG} --delete-secret-key ${EMAIL}"'
