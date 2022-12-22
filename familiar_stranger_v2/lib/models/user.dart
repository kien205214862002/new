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
  String?gmail;
  String? idFake;
  List<String>? listFriendId;
  List<String>? listPendingFriend;
  List<String>? listRecentConnect;
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
      this.gmail,
      this.idFake,
      this.listFriendId,
      this.listPendingFriend,
      this.listRecentConnect,
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
    gmail = json['gmail'];
    idFake = json['id_fake'];
    listFriendId = json['listFriendId']?.cast<String>();
    listPendingFriend = json['listPendingFriend']?.cast<String>();
    listRecentConnect = json['listRecentConnect']?.cast<String>();
    if (json['listImage'] != null) {
      listImage = <Image>[];
      json['listImage'].forEach((v) {
        listImage!.add(Image.fromJson(v));
      });
    }
    yearOfB = json['yearOfB'];
    sex = json['sex'];
    if(json['settingId'] != null){
      settingId = Setting.fromJson(json['settingId']);
    }
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
    data['gmail'] = gmail;
    data['id_fake'] = idFake;
    data['listFriendId'] = listFriendId;
    data['listPendingFriend'] = listPendingFriend;
    data['listRecentConnect'] = listRecentConnect;
    if (listImage != null) {
      data['listImage'] = listImage!.map((v) => v.toJson()).toList();
    }    data['yearOfB'] = yearOfB;
    data['sex'] = sex;
    data['settingId'] = settingId;
    data['token'] = token;
    return data;
  }
}