import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/controllers/home_controller.dart';
import 'package:mylinks/core/network/end_points.dart';
import 'package:mylinks/core/network/remote/dio_helper.dart';
import 'package:mylinks/models/link_model.dart';
import 'package:mylinks/models/links_model.dart';
import 'package:mylinks/views/widgets/custom_snackbar.dart';

class LinkApiController {
  LinkData addNewLink({required String title, required String link}) {
    DioHelper.postData(
            url: EndPoints.LINKS,
            data: {
              "title": title,
              "link": link,
            },
            token: GenericPreferences.getString("token"))
        .then((response) async {
      if (response.data != null) {
        if (response.statusCode == 200 && link.startsWith('http://') ||
            link.startsWith('https://')) {
          Get.back();
          const CustomSnackbar(
            title: "Your link added successfully",
            message: "Your link has been added",
            type: SnackbarType.success,
          ).show();
          return LinkData.fromJson(response.data['link']);
        } else {
          const CustomSnackbar(
            title: "add link Failed",
            message: "Please try again",
            type: SnackbarType.error,
          ).show();
          return LinkData();
        }
      }
    });
    return LinkData();
  }

  List<LinkData> fetchLinks() {
    String token = GenericPreferences.getString("token").toString();
    DioHelper.getData(
      url: EndPoints.LINKS,
      token: 'Bearer $token',
    ).then((response) {
      if (response.data != null) {
        print('response.statusCode');
        if (response.statusCode == 200) {
          var resposnseJson = jsonDecode(response.data);
          var links = resposnseJson['links'] as List;
          List<LinkData> linksList = links
              .map((e) => LinkData.fromJson(e as Map<String, dynamic>))
              .toList();
          return linksList;
        } else {
        }
      }
    }).catchError((error) {
      print('!! Erro: ${error.toString()}');
    });
    return [];
  }
}
