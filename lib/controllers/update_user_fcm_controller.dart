import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';
import 'package:mylinks/models/update_user_fcm.dart';
import 'package:mylinks/views/widgets/custom_snackbar.dart';

class UpdateUserFcmController extends GetxController{

  UpdateUserFcm? userFcm;

  void updateFcm() {
    int id = GenericPreferences.getInt('id');
    String fcm = GenericPreferences.getString('fcm');
    String token = GenericPreferences.getString('token');
    DioHelper.putData(url: '${EndPoints.UPDATE_USER_FCM}/$id', data: {
      'fcm': fcm,
    },
    token: 'Bearer $token'
    ).then((response) async {
        if (response.data != null) {
          userFcm = UpdateUserFcm.fromJson(response.data['user']);
          if (response.statusCode == 200) {
              GenericPreferences.setString("fcm",userFcm!.user!.fcm!);
              const CustomSnackbar(
                title: 'Fcm update',
                message: 'Fcm update user successful',
                type: SnackbarType.success,
              ).show();
          }
        }

    }).catchError((error) {
      CustomSnackbar(
        title: 'Fcm Failed',
        message: error.toString(),
        type: SnackbarType.error,
      ).show();
    });
  }

}