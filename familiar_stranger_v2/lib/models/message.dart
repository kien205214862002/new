class Message {
  String? senderId;
  String? avatarURL;
  String? content;
  bool? isImage;

  Message({this.senderId, this.avatarURL, this.content, this.isImage});

  Message.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    avatarURL = json['avatarURL'];
    content = json['content'];
    isImage = json['isImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['senderId'] = senderId;
    data['avatarURL'] = avatarURL;
    data['content'] = content;  
    data['isImage'] = isImage;
    return data;
  }

}