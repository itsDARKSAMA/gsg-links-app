import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  late TextEditingController _titleTextController;
  late TextEditingController _fullNameController;
  late TextEditingController _mobileController;
  late TextEditingController _linkController;

  @override
  void initState() {
    super.initState();
    _titleTextController = TextEditingController(text: 'Github');
    _fullNameController = TextEditingController(text: 'Anas Ashraf Alsafdi');
    _mobileController = TextEditingController(text: '0592204656');
    _linkController = TextEditingController(text: 'https://github.com/notifications');
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _fullNameController.dispose();
    _mobileController.dispose();
    _linkController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    margin: const EdgeInsetsDirectional.only(bottom: 50),
                    width: double.infinity,
                    height: 130,
                    color: AppColors.primaryColor,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                        height: 115,
                        width: 115,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset('assets/images/img.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      IconButton(onPressed: (){}, icon:const Icon(Icons.camera_enhance))
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _titleTextController,
                      cursorColor: AppColors.primaryColor,
                      decoration: InputDecoration(
                          label: const Text('Title'),
                          labelStyle: const TextStyle(color: AppColors.greyColor),
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
                                  color: AppColors.primaryColor
                              )
                          )
                      ),
                    ),
                    const SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _linkController,
                      cursorColor: AppColors.primaryColor,
                      decoration: InputDecoration(
                          label: const Text('link'),
                          labelStyle: const TextStyle(color: AppColors.greyColor),
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
                                  color: AppColors.primaryColor
                              )
                          )
                      ),
                    ),
                    const SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _mobileController,
                      cursorColor: AppColors.primaryColor,
                      decoration: InputDecoration(
                          label: const Text('Mobile Number'),
                          labelStyle: const TextStyle(color: AppColors.greyColor),
                          prefixIcon: const Icon(Icons.phone),
                          constraints: const BoxConstraints(
                            maxHeight: 55,
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor
                              )
                          )
                      ),
                    ),
                    const SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _fullNameController,
                      cursorColor: AppColors.primaryColor,
                      decoration: InputDecoration(
                          label: const Text('Full Name'),
                          labelStyle: const TextStyle(color: AppColors.greyColor),
                          prefixIcon: const Icon(Icons.person_pin_outlined),
                          constraints: const BoxConstraints(
                            maxHeight: 55,
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor
                              )
                          )
                      ),
                    ),
                    const SizedBox(height: 25,),
                    const SizedBox(height: 40,),
                    ElevatedButton(
                      onPressed: () {},
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
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ) ,
    );
=======
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/controllers/home_controller.dart';
import 'package:mylinks/controllers/settings_controller.dart';
import 'package:mylinks/views/widgets/custom_bottom_nav_bar.dart';
import 'package:mylinks/views/widgets/primary_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const String route = '/settings';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        init: Get.put(SettingsController()),
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: const CustomBottomNavBar(),
            body: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      margin: const EdgeInsetsDirectional.only(bottom: 50),
                      width: double.infinity,
                      height: 130,
                      color: AppColors.primaryColor,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.network(
                              'https://avatars.githubusercontent.com/u/58864791?v=4',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        IconButton.filled(
                          onPressed: () {},
                          color: AppColors.offWhiteColor,
                          icon: const Icon(Icons.camera_alt_rounded),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Form(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Full Name',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Mobile',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PrimaryButton(text: "Save", onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
>>>>>>> Stashed changes
  }
}
