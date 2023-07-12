class RegisterModel {
  String? message;
  UserRegisterData? user;
  String? token;

  RegisterModel({this.message, this.user, this.token});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = UserRegisterData.fromJson(json['user']);
    token = json['token'];
  }
}

class UserRegisterData {
  String? name;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  UserRegisterData(
      {this.name, this.email, this.updatedAt, this.createdAt, this.id});

  UserRegisterData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}
