class Message {
  String? senderId;
  String? avatarURl;
  String? content;
  bool? isImage;

  Message({this.senderId, this.avatarURl, this.content, this.isImage});

  Message.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    avatarURl = json['avatarURL'];
    content = json['content'];
    isImage = json['isImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['senderId'] = senderId;
    data['avatarURl'] = avatarURl;
    data['content'] = content;  
    data['isImage'] = isImage;
    return data;
  }

}