import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';
import 'package:mylinks/models/links_model.dart';

class HomeController extends GetxController {
  final String username = GenericPreferences.getString("name");
  final String followers = "N/A";
  final String following = "N/A";

  final String token = GenericPreferences.getString("token").toString();
}
