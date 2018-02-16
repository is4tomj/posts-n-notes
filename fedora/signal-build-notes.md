# Install Signal-Desktop on Fedora 27 (including npm and nodejs)

A dnf package for Signal-Desktop is not available yet. So we have to do things the hard way.

## Pre-req

```bash
$ sudo dnf install nodejs node-gyp dpkg fakeroot libXScrnSaver
```

Configure npm to run without sudo by following [these instructions on npmjs](https://docs.npmjs.com/getting-started/fixing-npm-permissions). This is technically optional, but why tf would you not do this? Just kidding, I don't give a shit about your answer.

## Fresh build

```bash
$ npm install --g electron-linux-installer electron
$ git clone git@github.com:WhisperSystems/Signal-Desktop.git
$ cd Signal-Desktop
$ npm install
$ npm run icon-gen
$ npm run build-release
$ ./release/linux-unpacked/signal-desktop
```

## Updating

```bash
$ git reset --hard HEAD # Get rid of some files that were generated from the previous build:
$ git pull origin master # Get new version
$ npm install
$ npm install -g electron
$ npm run icon-gen
$ npm run build-release
```

The binary is at the following path `./release/linux-unpacked/signal-desktop`.


