import 'package:flutter/material.dart';
import 'package:mylinks/constants/colors.dart';
import 'package:mylinks/constants/fonts.dart';

class CustomSearchItem extends StatelessWidget {
  const CustomSearchItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.offWhiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15),
            child: Container(
              width: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage('https://www.meshcc.com/wp-content/uploads/2022/02/Alex-Foord-e1644436249973.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Text(
            'mustafa shihab',
            style: Fonts.sb14,
          ),
        ],
      ),
    );
  }
}
