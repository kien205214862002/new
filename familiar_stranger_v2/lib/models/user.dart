import 'package:familiar_stranger_v2/models/image.dart';
import 'package:familiar_stranger_v2/models/setting.dart';

class User {
  String? id;
  String? username;
  String? phoneNumber;
  String? password;
  String? role;
  String? emotion;
  String? description;
  String? idFake;
  List<String>? listFriendId;
  List<Image>? listImage;
  String? yearOfB;
  String? sex;
  Setting? settingId;
  String? token;

  User(
      {this.id,
      this.username,
      this.phoneNumber,
      this.password,
      this.role,
      this.emotion,
      this.description,
      this.idFake,
      this.listFriendId,
      this.listImage,
      this.yearOfB,
      this.sex,
      this.settingId,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    role = json['role'];
    emotion = json['emotion'];
    description = json['description'];
    idFake = json['id_fake'];
    listFriendId = json['listFriendId'].cast<String>();
    if (json['listImage'] != null) {
      listImage = <Image>[];
      json['listImage'].forEach((v) {
        listImage!.add(Image.fromJson(v));
      });
    }
    yearOfB = json['yearOfB'];
    sex = json['sex'];
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
    data['emotion'] = emotion;
    data['description'] = description;
    data['id_fake'] = idFake;
    data['listFriendId'] = listFriendId;
    if (listImage != null) {
      data['listImage'] = listImage!.map((v) => v.toJson()).toList();
    }    data['yearOfB'] = yearOfB;
    data['sex'] = sex;
    data['settingId'] = settingId;
    data['token'] = token;
    return data;
  }
}