import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
=======
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/controllers/home_controller.dart';
import 'package:mylinks/views/widgets/custom_bottom_nav_bar.dart';
import 'package:mylinks/views/widgets/link_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = '/home';
>>>>>>> Stashed changes

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
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
                    const Text('Anas Ashraf Alsafadi',style: Fonts.m18,),
                    const SizedBox(height: 25,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsetsDirectional.all(15),
                            padding: const EdgeInsetsDirectional.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.secondaryColor
                            ),
                            child: const Column(
                              children: [
                                Text('170',style: TextStyle(color: AppColors.whiteColor,fontSize: 22)),
                                Text('Followers',style:TextStyle(color: AppColors.whiteColor,fontSize: 22)),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsetsDirectional.all(15),
                            padding: const EdgeInsetsDirectional.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.secondaryColor
                            ),
                            child: const Column(
                              children: [
                                Text('200',style: TextStyle(color: AppColors.whiteColor,fontSize: 22)),
                                Text('Following',style:TextStyle(color: AppColors.whiteColor,fontSize: 22)),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 2,color:Colors.grey[300],),
                    const SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondaryColor
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 30,),
                          Icon(Icons.facebook,color: AppColors.whiteColor,size: 40,),
                          SizedBox(width: 10,),
                          Text('Facebook',style: TextStyle(color: AppColors.whiteColor,fontSize: 22,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondaryColor
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 30,),
                          Icon(Icons.facebook,color: AppColors.whiteColor,size: 40,),
                          SizedBox(width: 10,),
                          Text('Instgram',style: TextStyle(color: AppColors.whiteColor,fontSize: 22,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondaryColor
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 30,),
                          Icon(Icons.facebook,color: AppColors.whiteColor,size: 40,),
                          SizedBox(width: 10,),
                          Text('Twitter',style: TextStyle(color: AppColors.whiteColor,fontSize: 22,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 60,
                             alignment: AlignmentDirectional.centerStart,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.secondaryColor
                            ),
                            child:Text('witter',style: TextStyle(color: AppColors.whiteColor,fontSize: 22,fontWeight: FontWeight.bold),),

                          ),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.yellowColor
                          ),
                          child:Icon(Icons.edit)

                        ),
                        SizedBox(width: 20,),
                        Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.redColor
                            ),
                            child:Icon(Icons.delete_forever_rounded)

                        ),

                      ],
                    ),


                  ],
                ),
              )

            ],
          ),
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
        ),
        backgroundColor: AppColors.secondaryColor,
        child: Icon(Icons.add,color:AppColors.whiteColor,),
      ),
    );
=======
    return GetBuilder<HomeController>(
        init: Get.put(HomeController()),
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
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      Text(
                        controller.username,
                        style: Fonts.sb16,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.secondaryColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.followers,
                                  style: Fonts.b24.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  'Followers',
                                  style: Fonts.r16.copyWith(
                                    color: AppColors.offWhiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Container(
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.secondaryColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.following,
                                  style: Fonts.b24.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  'Following',
                                  style: Fonts.r16.copyWith(
                                    color: AppColors.offWhiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.grey[300],
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: LinkCard(
                            title: 'Facebook',
                            icon: Icons.facebook,
                            onTap: () {},
                            onEdit: (context) {},
                            onDelete: (context) {},
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                Icons.add,
                color: AppColors.whiteColor,
              ),
            ),
          );
        });
>>>>>>> Stashed changes
  }
}
