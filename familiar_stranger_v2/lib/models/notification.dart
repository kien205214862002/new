class Notification {
  String? senderId;
  String? targetId;
  String? type;
  String? content;
  bool? read;

  Notification({this.senderId, this.targetId, this.type, this.content, this.read});

  Notification.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    targetId = json['targetId'];
    type = json['type'];
    content = json['content'];
    read = json['read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['senderId'] = senderId;
    data['targetId'] = targetId;
    data['type'] = type;
    data['content'] = content;  
    data['read'] = read;
    return data;
  }

}