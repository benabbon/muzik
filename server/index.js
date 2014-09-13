var Firebase = require('firebase');
var midi = require('midi');

var root = 'https://muzik.firebaseio.com/';

var api = {
  instrument: new Firebase(root + 'instrument'),
};

var outputs = {
  keyboard: new midi.output(),
  drums: new midi.output()
};

outputs.keyboard.openVirtualPort('keyboard');
outputs.drums.openVirtualPort('drums');

var Codes = {
  START: 144
};

api.instrument.on('child_added', function(data) {
  var val = data.val();
  if (val) {
    outputs[val.instrument].sendMessage([Codes.START, val.note, val.velocity]);
  }
});
