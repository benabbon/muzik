var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var midi = require('midi');

var outputs = {
  keyboard: new midi.output(),
  drums: new midi.output()
};

outputs.keyboard.openVirtualPort('keyboard');
outputs.drums.openVirtualPort('drums');

app.get('/', function(req, res){
  res.sendfile('index.html');
});

var Codes = {
  START: 144
};

io.sockets.on('connection', function(socket) {
  console.log('Connection');

  socket.on('keyboard', function(request) {
    request = JSON.parse(request);
    try {
      outputs.keyboard.sendMessage([Codes.START, request.note, request.velocity]);
    }
    catch(error) {
      console.error(error);
    }
  });

  socket.on('drums', function(request) {
    request = JSON.parse(request);
    console.log(request);
    try {
      outputs.drums.sendMessage([Codes.START, request.note, request.velocity]);
    }
    catch(error) {
      console.error(error);
    }
  });
});

http.listen(3000, function(){
  console.log('Listening on port 3000');
});
