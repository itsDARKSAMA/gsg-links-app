class UpdateUserLocation {
   LocationModel? user;


  UpdateUserLocation.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ?  LocationModel.fromJson(json['user']) : null;
  }


}

class LocationModel {
   String? lat;
   String? long;


  LocationModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }


}