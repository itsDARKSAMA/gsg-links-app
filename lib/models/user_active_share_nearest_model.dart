import 'package:mylinks/models/user_login_model.dart';

class UserActiveShareModel {
  int? count;
  List<NearestUsers>? nearestUsers;

  UserActiveShareModel({count, nearestUsers});

  UserActiveShareModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['nearest-users'] != null) {
      nearestUsers = <NearestUsers>[];
      json['nearest-users'].forEach((v) {
        nearestUsers!.add(NearestUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (nearestUsers != null) {
      data['nearest-users'] = nearestUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NearestUsers {
  int? id;
  int? userId;
  String? type;
  String? createdAt;
  String? updatedAt;
  double? distance; // Update the type to double
  UserData? user;

  NearestUsers(
      {this.id,
      this.userId,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.distance,
      this.user});

  NearestUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    distance = json['distance'].toDouble(); // Convert the value to double
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['distance'] = distance;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
