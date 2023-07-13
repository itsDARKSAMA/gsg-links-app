import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mylinks/constants/colors.dart';

class LinkCard extends StatelessWidget {
  const LinkCard({
    super.key,
    required this.title,
    required this.icon,
    //required this.onTap,
    required this.onDoubleTap,
    required this.onLongPress,
    required this.onEdit,
    required this.onDelete,
  });

  final String title;
  final IconData icon;
  //final Function() onTap;
  final Function() onDoubleTap;
  final Function() onLongPress;
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
      child: GestureDetector(
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        child: InkWell(
          //onTap: onTap,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.secondaryColor),
            child: Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const Icon(
                  Icons.link,
                  color: AppColors.whiteColor,
                  size: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
