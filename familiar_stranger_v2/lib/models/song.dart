class Song {
  String? id;
  String? name;
  String? link;
  bool? select;

  Song({this.id, this.name, this.link, this.select});

  Song.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    link = json['link'];
    select = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['link'] = link;
    data['select'] = select;
    return data;
  }
}
