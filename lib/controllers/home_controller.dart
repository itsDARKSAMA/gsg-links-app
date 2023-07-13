import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';
import 'package:mylinks/models/links_model.dart';
import 'package:mylinks/views/screens/auth/login_screen.dart';
import 'dart:developer' as dev;

class HomeController extends GetxController {
  final String username = "DaRK-SAMA";
  final String followers = "140";
  final String following = "12";

  final String token = GenericPreferences.getString("token").toString();
  //final String token= "12|nryCAMK9toQzvfdHjUc15tfioJTgRn2SqFF220gM";

  bool isCompleted = false;

  List<String>? linkList = [];

  Links? linksModel;
  void fetchLinks(){
    DioHelper.getData(
        url: EndPoints.LINKS,
        token: 'Bearer $token',
    ).then((response) {
      if (response.data != null) {
        linksModel = Links.fromJson(response.data);
        if (response.statusCode == 200) {
            return linksModel!.links!.forEach((element) {
              linkList!.add(element.title!.toString());
              isCompleted = true;
              update();
            });
        }
      }
    }).catchError((error) {
      print('!! Erro: ${error.toString()}');
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchLinks();
  }

}
