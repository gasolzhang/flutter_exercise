/**
 *  Author:GasolZhang
 *  Date:2020-04-04
 */
import 'package:socket_io/socket_io.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
///
class SockwetDemo{
  void startServer(){
    var io = new Server();
    var nsp = io.of('/some');
    nsp.on('connection', (client) {
      print('connection /some');
      client.on('msg', (data) {
        print('data from /some => $data');
        client.emit('fromServer', "ok 2");
      });
    });
    io.on('connection', (client) {
      print('connection default namespace');
      client.on('msg', (data) {
        print('data from default => $data');
        client.emit('fromServer', "ok");
      });
    });
    io.listen(3000);
  }

  void startClient(){
    // Dart client

    IO.Socket socket = IO.io('http://localhost:3000');
    socket.on('connect', (_) {
      print('connect');
      socket.emit('msg', 'test');
    });
    socket.on('event', (data) => print(data));
    socket.on('disconnect', (_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }
}