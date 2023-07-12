import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';

class ActiveSharingController extends GetxController {
  final _activeSharing = false.obs;
  bool get activeSharing => _activeSharing.value;
  set activeSharing(bool value) => _activeSharing.value = value;

  void setActiveSharing() {
    final token = GenericPreferences.getString('token');
    final id = GenericPreferences.getInt('id');
    DioHelper.postData(
      url: '${EndPoints.ACTIVE_SAHRE}/$id',
      data: {
        'type': "sender",
      },
      token: token,
    ).then((response) {
      if (response.statusCode == 200) {
        print(response.data);
      }
    });
  }
}
