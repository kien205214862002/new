class Song {
  String? id;
  String? title;
  String? musicUrl;
  bool? select;

  Song({this.id, this.title, this.musicUrl, this.select});

  Song.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    musicUrl = json['musicUrl'];
    select = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['musicUrl'] = musicUrl;
    data['select'] = select;
    return data;
  }
}
