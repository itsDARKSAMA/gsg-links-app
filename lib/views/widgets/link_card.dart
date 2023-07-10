import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mylinks/constants/colors.dart';

class LinkCard extends StatelessWidget {
  const LinkCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  final String title;
  final IconData icon;
  final Function() onTap;
  final Function(BuildContext) onEdit;
  final Function(BuildContext) onDelete;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        extentRatio: 0.5,
        children: [
          SlidableAction(
            onPressed: onEdit,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            backgroundColor: AppColors.yellowColor,
            icon: Icons.edit_outlined,
            foregroundColor: AppColors.whiteColor,
          ),
          SlidableAction(
            onPressed: onDelete,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            backgroundColor: AppColors.redColor,
            icon: Icons.delete,
            foregroundColor: AppColors.whiteColor,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.secondaryColor),
          child: const Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Icon(
                Icons.facebook,
                color: AppColors.whiteColor,
                size: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Facebook',
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
