# μzik

This is a collaborative music perfomance tool. Made for PennApps X, Fall 2014.

## Install

Make sure you have Git and Node installed. Run

```bash
$ npm install -g grunt-cli bower
```

to get the build tools, Grunt and Bower. Then get a copy of the repo with

```bash
$ git clone https://github.com/lavelle/muzik
$ cd muzik
$ npm install
$ bower install
```

to start the server, run

```bash
$ cd server
$ npm install
$ node index.js &
```

then build the client with

```
$ cd ..
$ grunt
$ grunt connect &
```

and navigate to `http://localhost:8080` in your browser.

You'll need to create new tracks in your DAW for the piano, synth and drums, and connect them to the three virtual MIDI inputs with those names that are created when the server is running.

## License

MIT licensed

Copyright (c) 2014 Giles Lavelle
