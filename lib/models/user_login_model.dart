
class UserLoginModel
{
  String? token;
  UserData? userData;

  UserLoginModel.fromJson(Map<String, dynamic> json)
  {
    token = json['token'];
    userData = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }
}

class UserData
{
  int? id;
  String? name;
  String? email;
  String? email_verified_at;
  String? created_at;
  String? updated_at;
  int? isActive;
  String? country;
  String? ip;
  double? long;
  double? lat;
  String? fcm;

UserData({
    this.id,
    this.name,
    this.email,
    this.email_verified_at,
    this.created_at,
    this.updated_at,
    this.isActive,
    this.country,
    this.ip,
    this.long,
    this.lat,
    this.fcm ,
});

  UserData.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    email_verified_at = json['email_verified_at'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    isActive = json['isActive'];
    country = json['country'];
    ip = json['ip'];
    long = json['long'];
    lat = json['lat'];
    fcm = json['fcm'];
  }
}