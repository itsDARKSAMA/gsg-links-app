class UpdateUserFcm {
  FcmModel? user;


  UpdateUserFcm.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ?  FcmModel.fromJson(json['user']) : null;
  }


}
class FcmModel {
  String? fcm;


  FcmModel.fromJson(Map<String, dynamic> json) {
    fcm = json['fcm'];
  }

}