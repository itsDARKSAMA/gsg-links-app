import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';
import 'package:mylinks/models/update_user_location.dart';
import 'package:mylinks/views/widgets/custom_snackbar.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:get/get.dart';

class LocationController extends GetxController {
  UpdateUserLocation? userLocation;

  LocationController get to => Get.find<LocationController>();
  DateTime? lastRequestTime;

  @override
  void onInit() {
    super.onInit();
    checkLocationPermission();
  }

  Future<void> checkLocationPermission() async {
    if (await Permission.location.request().isGranted) {
      updateUserLocation();
    } else {
      openAppSettings();
      const CustomSnackbar(
        title: 'location permission Failed',
        message: 'Please grant location permission to continue',
        type: SnackbarType.error,
      ).show();
    }
  }

  Future<void> updateUserLocation() async {
    if (isTimeElapsed()) {
      await sendRequest();
      updateRequestTime();
      Future.delayed(const Duration(minutes: 1), () {
        updateUserLocation();
      });
    }
  }

  bool isTimeElapsed() {
    if (lastRequestTime == null) {
      return true;
    }
    final difference = DateTime.now().difference(lastRequestTime!);
    return difference.inMinutes >= 1;
  }

  Future<void> sendRequest() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    double latitude = position.latitude;
    double longitude = position.longitude;
    int id = GenericPreferences.getInt('id');
    String token = GenericPreferences.getString('token');
    DioHelper.putData(
            url: '${EndPoints.UPDATE_USER_LOCATION}/$id',
            data: {
              'lat': latitude.toString(),
              'long': longitude.toString(),
            },
            token: 'Bearer $token')
        .then((response) async {
      if (response.data != null) {
        print(response.statusCode);
        if (response.statusCode == 200) {
          // const CustomSnackbar(
          //   title: 'Location Updated',
          //   message: 'Update User Location Successfully',
          //   type: SnackbarType.success,
          // ).show();
        } else if (response.statusCode == 401) {}
      }
    }).catchError((error) {
      print(error);
      CustomSnackbar(
        title: 'Updated Failed',
        message: error.toString(),
        type: SnackbarType.error,
      ).show();
    });
  }

  void updateRequestTime() {
    lastRequestTime = DateTime.now();
  }
}
