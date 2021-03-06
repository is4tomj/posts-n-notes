# Install Signal-Desktop on Fedora 27 (including npm and nodejs)

A dnf package for Signal-Desktop is not available yet. So we have to do things the hard way.

## Pre-req

```bash
$ sudo dnf install nodejs node-gyp dpkg fakeroot libXScrnSaver rpm-build
```

Configure npm to run without sudo by following [these instructions on npmjs](https://docs.npmjs.com/getting-started/fixing-npm-permissions). This is technically optional, but why tf would you not do this? Just kidding, I don't give a shit about your answer.

## Fresh build

```bash
$ npm install --g electron-linux-installer electron
$ git clone git@github.com:WhisperSystems/Signal-Desktop.git
$ cd Signal-Desktop
```

Edit the `package.json` scripts to include the following in the `scripts` section:
`"dist-rpm": "npm run generate && SIGNAL_ENV=production npm run build -- --linux rpm",`

Finish fresh build by following the steps for updating.

## Updating

```bash
$ git reset --hard HEAD # Get rid of some files that were generated from the previous build:
$ git pull origin master # Get new version
$ npm install
$ npm install -g electron
$ npm run icon-gen
$ npm run build-release
$ npm run dist-prod
$ npm run dist-rpm
```

The binary is at `./dist/linux-unpacked/signal-desktop` and the rpm is at `./dist/signal-desktop-*.rpm`. You can run the following command:

```bash
$ sudo dnf install ./dist/signal-desktop-*.rpm
```



