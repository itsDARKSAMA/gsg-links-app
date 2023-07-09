import 'package:flutter/material.dart';
import 'package:mylinks/constants/colors.dart';

class CustomProfileHeader extends StatelessWidget {
  const CustomProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 116,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: AppColors.primaryGradient,
          ),
        ),
        Positioned(
          top: 75,
          child: Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                  width: 4,
                  color: AppColors.whiteColor
              ),
              image: const DecorationImage(
                image: NetworkImage("https://www.meshcc.com/wp-content/uploads/2022/02/Alex-Foord-e1644436249973.jpg"),
                fit: BoxFit.cover,
              ),
            ),

          ),
        ),
        Positioned(
          left: 16,
          top: 45,
          child: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.whiteColor,
            ),
          ),
        )
      ],
    );
  }
}
