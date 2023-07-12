import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';
import 'package:mylinks/views/widgets/custom_snackbar.dart';

class ActiveSharingController extends GetxController {
  final _token = GenericPreferences.getString('token');
  final _id = GenericPreferences.getInt('id');

  @override
  void onInit() {
    super.onInit();
  }

  void startSharing(String type) {
    print("here dark sama");
    DioHelper.postData(
      url: '${EndPoints.ACTIVE_SAHRE}/$_id',
      data: {
        'type': type.toLowerCase(),
      },
      token: _token,
    ).then((response) {
      if (response.statusCode == 200) {
        print(response.data);
      } else {
        print(response.data);
      }
    });
  }

  void stopSharing() {
    String url = "${EndPoints.ACTIVE_SAHRE}/$_id";
    DioHelper.deleteData(
      url: url,
      token: "Bearer $_token",
      query: {"Accept": "application/json"},
    ).then((response) {
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Delete Success");
      } else {
        print("feild");
      }
    });
  }

  void setType(String type) {
    type = type;
    update();
  }
}
