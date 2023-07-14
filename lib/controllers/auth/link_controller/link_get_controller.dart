import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/generic_preferences.dart';
import 'package:mylinks/controllers/auth/link_controller/add_new_link_controller.dart';
import 'package:mylinks/models/link_model.dart';

class LinkGetxController extends GetxController {
  final String username = GenericPreferences.getString("name");
  final String followers = "N/A";
  final String following = "N/A";

  final formKey = GlobalKey<FormState>();
  final titleTextController = TextEditingController();
  final linkTextController = TextEditingController();

  bool load = false;
  @override
  void onInit() {
    super.onInit();
    getLinks();
  }

  LinkApiController _apiController = LinkApiController();

  List<LinkData> lists = [];

  void getLinks() {
    load = true;
    update();
    lists = _apiController.fetchLinks();
    load = false;
    update();
  }

  void addLink({required String title, required String link}) {
    LinkData linkData = _apiController.addNewLink(title: title, link: link);
    lists.add(linkData);
    titleTextController.clear();
    linkTextController.clear();
    update();
  }
}
