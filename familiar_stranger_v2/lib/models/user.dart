import 'package:familiar_stranger_v2/models/image.dart';
import 'package:familiar_stranger_v2/models/setting.dart';

class User {
  String? id;
  String? username;
  String? phoneNumber;
  String? password;
  String? role;
  String? idFake;
  List<String>? listFriendId;
  List<Image>? imageId;
  String? yearOfB;
  String? sex;
  String? recentState;
  Setting? settingId;
  String? token;

  User(
      {this.id,
      this.username,
      this.phoneNumber,
      this.password,
      this.role,
      this.idFake,
      this.listFriendId,
      this.imageId,
      this.yearOfB,
      this.sex,
      this.recentState,
      this.settingId,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    role = json['role'];
    idFake = json['id_fake'];
    listFriendId = json['listFriendId'].cast<String>();
    if (json['imageId'] != null) {
      imageId = <Image>[];
      json['imageId'].forEach((v) {
        imageId!.add(Image.fromJson(v));
      });
    }
    yearOfB = json['yearOfB'];
    sex = json['sex'];
    recentState = json['recentState'];
    settingId = Setting.fromJson(json['settingId']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['username'] = username;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['role'] = role;
    data['id_fake'] = idFake;
    data['listFriendId'] = listFriendId;
    if (imageId != null) {
      data['imageId'] = imageId!.map((v) => v.toJson()).toList();
    }    data['yearOfB'] = yearOfB;
    data['sex'] = sex;
    data['recentState'] = recentState;
    data['settingId'] = settingId;
    data['token'] = token;
    return data;
  }
}