import 'package:mylinks/models/user_login_model.dart';

class LinkModel {
  LinkData? link;

  LinkModel({this.link});

  LinkModel.fromJson(Map<String, dynamic> json) {
    link = json['link'] != null ? LinkData.fromJson(json['link']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (link != null) {
      data['link'] = link!.toJson();
    }
    return data;
  }
}

class LinkData {
  int? id;
  String? title;
  String? link;
  Null? username;
  int? isActive;
  int? userId;
  String? createdAt;
  String? updatedAt;
  UserData? user;

  LinkData(
      {this.id,
      this.title,
      this.link,
      this.username,
      this.isActive,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user});

  LinkData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    username = json['username'];
    isActive = json['isActive'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['link'] = link;
    data['username'] = username;
    data['isActive'] = isActive;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
