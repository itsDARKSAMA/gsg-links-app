import 'package:mylinks/models/user_login_model.dart';

class LinkModel {
late List<LinkData> links;

  LinkModel();
  LinkModel.fromJson(Map<String, dynamic> json) {
    if (json['links'] != null) {
      links =[];
      json['links'].forEach((v) {
        links.add(LinkData.fromJson(v));
      });
    }
  }
}

class LinkData {
  late int id;
  late String title;
  late String link;
  String? username;
  int? isActive;
  int? userId;
  String? createdAt;
  String? updatedAt;
  UserData? user;

  LinkData();

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

 
}
