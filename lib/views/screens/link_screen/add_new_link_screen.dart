import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/controllers/auth/add_link/link_controller.dart';

class AddNewLinkScreen extends StatelessWidget {
  const AddNewLinkScreen({Key? key}) : super(key: key);
  static const route = '/addLink';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.blackColor,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'New Link',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsetsDirectional.only(top: 80, start: 25, end: 25),
          child: GetBuilder<AddNewLinkController>(
              init: Get.put(AddNewLinkController()),
              builder: (controller) {
                return Column(
                  children: [
                    TextFormField(
                      controller: controller.titleTextController,
                      keyboardType: TextInputType.text,
                      cursorColor: AppColors.primaryColor,
                      decoration: InputDecoration(
                          label: const Text('Title'),
                          labelStyle:
                              const TextStyle(color: AppColors.greyColor),
                          prefixIcon: const Icon(Icons.title),
                          constraints: const BoxConstraints(
                            maxHeight: 55,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.linkTextController,
                      cursorColor: AppColors.primaryColor,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelStyle:
                              const TextStyle(color: AppColors.greyColor),
                          label: const Text('Link'),
                          prefixIcon: const Icon(Icons.link_outlined),
                          constraints: const BoxConstraints(
                            maxHeight: 55,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.addNewLink(
                            title: controller.titleTextController.text,
                            link: controller.linkTextController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 55),
                        backgroundColor: AppColors.secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: Fonts.b20.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
