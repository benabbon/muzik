var Firebase = require('firebase');
var midi = require('midi');

var root = 'https://muzik.firebaseio.com/';

var api = {
  keyboard: new Firebase(root + 'keyboard'),
  drums: new Firebase(root + 'drums')
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

api.keyboard.on('child_added', function(data) {
  var val = data.val();
  if (val) {
    outputs.keyboard.sendMessage([Codes.START, val.note, val.velocity]);
  }
});

api.drums.on('child_added', function(data) {
  var val = data.val();
  if (val) {
    outputs.drums.sendMessage([Codes.START, val.note, val.velocity]);
  }
});
