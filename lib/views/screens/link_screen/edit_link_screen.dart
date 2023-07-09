import 'package:flutter/material.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';

class EditLinkScreen extends StatefulWidget {
  const EditLinkScreen({Key? key}) : super(key: key);

  @override
  State<EditLinkScreen> createState() => _EditLinkScreenState();
}

class _EditLinkScreenState extends State<EditLinkScreen> {

  late TextEditingController _titleTextController;
  late TextEditingController _linkTextController;

  @override
  void initState() {
    super.initState();
    _titleTextController = TextEditingController(text: 'Github');
    _linkTextController = TextEditingController(text: 'https://github.com/notifications');
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _linkTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios_new,color:AppColors.blackColor,),
        title: const Text('Edit Link',style: TextStyle(fontSize: 22),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: 80,start: 25,end: 25),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _titleTextController,
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                    label: const Text('Title'),
                    labelStyle: TextStyle(color: AppColors.greyColor),
                    prefixIcon: const Icon(Icons.title),
                    constraints: const BoxConstraints(
                      maxHeight: 55,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.primaryColor
                        )
                    )
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.text,
                controller:_linkTextController ,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: AppColors.greyColor),
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
                        borderSide: BorderSide(
                            color: AppColors.primaryColor
                        )
                    )
                ),
              ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
