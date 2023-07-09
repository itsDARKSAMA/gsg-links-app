import 'package:flutter/material.dart';
import 'package:mylinks/constants/fonts.dart';
import 'package:mylinks/views/widgets/custom_follow_numbers.dart';
import 'package:mylinks/views/widgets/custom_profile_follow_button.dart';
import 'package:mylinks/views/widgets/custom_profile_header.dart';
import 'package:mylinks/views/widgets/custom_social_media_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Column(
        children: [
          CustomProfileHeader(),
          SizedBox(height: 60,),
          Text('Mustafa Shihab',style: Fonts.sb16,),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomFollowNumbers(number: 170,followName: 'Followers'),
                    Spacer(),
                    CustomFollowNumbers(number: 21,followName: 'Following'),
                  ],
                ),
                SizedBox(height: 15,),
                CustomProfileFollowButton(),
                SizedBox(height: 50,),
                CustomSocailMediaButton(
                  buttonName: 'Facebook',
                  iconPath: 'assets/icons/facebook_icon.svg',
                ),
                SizedBox(height: 15,),
                CustomSocailMediaButton(
                  buttonName: 'Twitter',
                  iconPath: 'assets/icons/twitter_icon.svg',
                ),
                SizedBox(height: 15,),
                CustomSocailMediaButton(
                  buttonName: 'Github',
                  iconPath: 'assets/icons/github_icon.svg',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



