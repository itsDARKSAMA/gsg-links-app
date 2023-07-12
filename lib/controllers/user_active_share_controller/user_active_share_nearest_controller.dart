import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';
import 'package:mylinks/models/user_active_share_nearest_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserActiveSharController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final prefs = SharedPreferences.getInstance();

  int id = GenericPreferences.getInt("id");

  UserActiveShareModel? userActiveShareNearestModel;
  List<UserActiveShareModel> userActiveShareNearestModelList = [];

  Future<List> getUserActiveSharSender() async {
    String url = EndPoints.NEAREST_SENDER.replaceFirst("{id}", id.toString());
    try {
      var response = await DioHelper.getData(
          url: url,
          token: GenericPreferences.getString("token"),
          query: {
            "User-Agent": "PostmanRuntime/7.32.3",
            "Accept": "application/json"
          });
      if (response.statusCode == 200) {
        var jsoneList = response.data["nearest-users"] as List;
        return jsoneList;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}
