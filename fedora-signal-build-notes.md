# Signal (including npm and nodejs)

A dnf package for Signal-Desktop is not available yet. So we have to do things the hard way.

```bash
$ sudo dnf install nodejs node-gyp dpkg fakeroot libXScrnSaver
```

Configure npm to run without sudo by following [these instructions on npmjs](https://docs.npmjs.com/getting-started/fixing-npm-permissions). This is technically optional, but why tf would you not do this? Just kidding, I don't give a shit about your answer.

```bash
$ npm install --global electron-linux-installer
$ git clone git@github.com:WhisperSystems/Signal-Desktop.git
$ cd Signal-Desktop
$ npm run icon-gen
$ npm run build-release
$ ./release/linux-unpacked/signal-desktop
```
