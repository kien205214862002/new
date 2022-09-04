class Image {
  String? id;
  String? imageId;
  String? imageUrl;
  String? type;

  Image({this.id, this.imageId, this.imageUrl, this.type});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    imageId = json['imageId'];
    imageUrl = json['imageUrl'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['imageId'] = imageId;
    data['imageUrl'] = imageUrl;  
    data['type'] = type;
    return data;
  }
}