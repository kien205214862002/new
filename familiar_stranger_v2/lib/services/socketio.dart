import 'package:familiar_stranger_v2/controllers/conversationController.dart';
import 'package:familiar_stranger_v2/services/api.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as socketIO;

late socketIO.Socket socket;
ConversationController controller = Get.put(ConversationController());

void connectSocket() {
  socket = socketIO.io('http://192.168.0.196:3000', <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });
  socket.connect();
  socket.on('connect', (data) {
    print('Connected');

    socket.on('to-conversation', (data) => {
      controller.toConversation(data)
    });

    socket.on('disconnect-conversation', (data) => {
      Get.back()
    });

    socket.on('message', (data) => {
      //print(data),
      conversationController.updateListMessage(data)
    });
  });
}

void signinSocket(id){
  socket.emit('signin', id);
}

void logoutSocket(){
  socket.emit('logout');
}

void disconnect(){

  //socket.off('signin');

  socket.disconnect();

  socket.on('disconnect',(data){
    print('disconnect');
  });
}

void startConnect(){
  socket.emit('start-connect');
}

void stopConnect(){
  socket.emit('stop-connect');
}

void disconnectConversation(){
  socket.emit('disconnect-conversation');
}

void message(data){
  socket.emit('message', data);
}