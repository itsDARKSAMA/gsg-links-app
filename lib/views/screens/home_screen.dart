import 'package:flutter/material.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  }
}
