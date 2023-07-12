import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';
import 'package:mylinks/models/search_model.dart';
import 'package:mylinks/views/widgets/custom_snackbar.dart';

class SearchsController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxList<SearchModel> searchList = <SearchModel>[].obs;
  final _token = GenericPreferences.getString('token');

  void search(String value) {
    searchList.clear();
    DioHelper.postData(
      url: EndPoints.SEARCH,
      data: {
        'name': searchController.text,
      },
      token: _token,
    ).then((response) async {
      if (response.data != null) {
        if (response.statusCode == 200) {
          if (response.data['user'] != null) {
            response.data['user'].forEach((value) {
              searchList.add(SearchModel.fromJson(value));
            });
            update();
          }
        }
      }
    }).catchError((error) {
      CustomSnackbar(
        title: 'Search Failed',
        message: error.toString(),
        type: SnackbarType.error,
      ).show();
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    searchController.clear();
    searchList.clear();
  }
}
