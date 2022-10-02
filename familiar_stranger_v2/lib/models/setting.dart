class Setting {
  String? id;
  bool? sound;
  bool? vibration;
  bool? notification;
  String? status;

  Setting(
      {this.id, this.sound, this.vibration, this.notification, this.status});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    sound = json['sound'];
    vibration = json['vibration'];
    notification = json['notification'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['sound'] = sound;
    data['vibration'] = vibration;
    data['notification'] = notification;
    data['status'] = status;
    return data;
  }
}