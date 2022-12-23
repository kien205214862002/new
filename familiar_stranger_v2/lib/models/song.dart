class Song {
  String? id;
  String? title;
  String? musicUrl;
  bool? select;
  bool? isPlay;

  Song({this.id, this.title, this.musicUrl, this.select});

  Song.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    musicUrl = json['musicUrl'];
    select = false;
    isPlay = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['musicUrl'] = musicUrl;
    return data;
  }
}
