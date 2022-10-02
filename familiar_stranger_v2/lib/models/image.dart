class Image {
  String? id;
  String? imageId;
  String? imageUrl;
  String? uploadTime;
  String? type;

  Image({this.id, this.imageId, this.imageUrl, this.uploadTime,this.type});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    imageId = json['imageId'];
    imageUrl = json['imageUrl'];
    uploadTime = json['uploadTime'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['imageId'] = imageId;
    data['imageUrl'] = imageUrl;  
    data['uploadTime'] = uploadTime;
    data['type'] = type;
    return data;
  }
}