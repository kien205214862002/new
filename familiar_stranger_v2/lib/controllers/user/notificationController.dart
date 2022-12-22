//import 'package:familiar_stranger_v2/controllers/user/authController.dart';
import 'package:familiar_stranger_v2/models/notification.dart';
import 'package:familiar_stranger_v2/services/api.dart';
import 'package:familiar_stranger_v2/services/socketio.dart';
import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';

class NotificationController extends GetxController {
  RxList listNotification = [].obs;

  void loadInitNotification() async {
    await getNotification();
  }

  void sendInviteToRoom(targetId) async {
    var content = "${userController.currentUser.value.username} send invite to room";
    var notification = Notification(
        senderId: userController.currentUser.value.id,
        targetId: targetId,
        type: "InviteToRoom",
        content: content,
        read: false);
    SendInvite(notification.toJson());
    
  }

  void acceptInviteToRoom(senderId)async {
    acceptInvite(senderId);
  }

  void sendAddFriend(targetId) async {
    var content =
        "${userController.currentUser.value.username} send invit to add friend";
    var notification = Notification(
        senderId: userController.currentUser.value.id,
        targetId: targetId,
        type: "Invite to add friend",
        content: content,
        read: false);
    SendInvite(notification.toJson());
  }

  void addNotification(data) async {
    var notification = Notification.fromJson(data);
    listNotification.add(notification);
    update(['listNotification']);
    //print(listNotification[0].type);
  }

  void acceptNotificationTypeInviteRoom(notification) {}
}
