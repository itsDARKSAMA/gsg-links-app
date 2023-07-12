import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';
import 'package:mylinks/models/link_model.dart';
import 'package:mylinks/views/widgets/custom_snackbar.dart';

class AddNewLinkController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleTextController = TextEditingController();
  final linkTextController = TextEditingController();

  LinkModel? linkModel;

  void addNewLink({required String title, required String link}) {
    DioHelper.postData(
            url: EndPoints.LINKS,
            data: {
              "title": title,
              "link": link,
            },
            token: GenericPreferences.getString("token"))
        .then((response) async {
      if (response.data != null) {
        linkModel = LinkModel.fromJson(response.data);
        if (response.statusCode == 200 && link.startsWith('http://') ||
            link.startsWith('https://')) {
          titleTextController.clear();
          linkTextController.clear();
          Get.back();
          CustomSnackbar(
            title: "Your link added successfully",
            message: "Your link has been added: ${linkModel!.link!.title}",
            type: SnackbarType.success,
          ).show();
        } else {
          const CustomSnackbar(
            title: "add link Failed",
            message: "Please try again",
            type: SnackbarType.error,
          ).show();
        }
      }
    });
  }
}
