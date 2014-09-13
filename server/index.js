var Firebase = require('firebase');
var midi = require('midi');

var root = 'https://muzik.firebaseio.com/';

var api = {
  instrument: new Firebase(root + 'instrument'),
};

var outputs = {};

var Codes = {
  START: 144
};

api.instrument.on('child_added', function(data) {
  var val = data.val();
  if (val) {
    var instrument = val.instrument;

    if (!outputs[instrument]) {
      outputs[instrument] = new midi.output()
      outputs[instrument].openVirtualPort(instrument)
    }

    outputs[instrument].sendMessage([Codes.START, val.note, val.velocity]);
  }
});
