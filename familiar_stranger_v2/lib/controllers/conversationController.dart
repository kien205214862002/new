import 'package:familiar_stranger_v2/controllers/time_counter.dart';
import 'package:familiar_stranger_v2/models/message.dart';
import 'package:familiar_stranger_v2/models/user.dart';
import 'package:familiar_stranger_v2/services/api.dart';
import 'package:familiar_stranger_v2/services/socketio.dart';
import 'package:familiar_stranger_v2/ui/screens/chat/chatroom.dart';
import 'package:get/get.dart';

CounterController counterController = Get.put(CounterController());


class ConversationController extends GetxController {
    late Rx<User> targetUser;
    RxList listMessage = [].obs;

    void sendMessage(userId, avtURL, content, isImage){
      var mess = Message(senderId: userId, avatarURl: avtURL, content: content, isImage: isImage);
      message(mess.toJson());
    }

    void updateListMessage(data){
      var mess = Message.fromJson(data);
      listMessage.add(mess);
      update(['listMessage']);
      //print(listMessage);
    }

  Future<bool> toConversation(targerId) async {
    listMessage.length = 0 ;
    if (await getUserByID(targerId)) {
      counterController.stopCounter();
      Get.to(() => const ChatRoomScreen());
      return true;
    }
    return false;
  }

  void getOutConversation() async {
    disconnectConversation();
    Get.back();
  }

}