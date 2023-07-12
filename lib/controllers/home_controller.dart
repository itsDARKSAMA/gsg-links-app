import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';

class HomeController extends GetxController {
  final String username = "DaRK-SAMA";
  final String followers = "140";
  final String following = "12";

  @override
  void onReady() {
    super.onReady();
    if (!GenericPreferences.containsKey("token")) {
      Get.offAllNamed(LoginScreen.route);
    }
  }
}
