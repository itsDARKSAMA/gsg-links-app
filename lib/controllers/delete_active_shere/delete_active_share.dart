import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';

class DeleteActiveShareController extends GetxController {
  final formKey = GlobalKey<FormState>();
  int id = GenericPreferences.getInt("id");
  String token = GenericPreferences.getString("token");

  void deleteActiveShare() {
    String url = EndPoints.DELETE_SHERE.replaceFirst("{id}", id.toString());
    DioHelper.deleteData(
        url: url,
        token: "Bearer "+token,
        query: {"Accept": "application/json"}).then((response) {
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Delete Success");
      } else {
        print("feild");
      }
    });
  }
}
