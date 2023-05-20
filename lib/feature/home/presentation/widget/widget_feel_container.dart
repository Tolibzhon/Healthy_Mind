import 'package:flutter/material.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class WidgetFeelContainer extends StatelessWidget {
  const WidgetFeelContainer(
      {super.key,
      required this.feel,
      required this.isActive,
      required this.onTap,
      required this.smile});
  final String feel;
  final String smile;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 65,
        height: 70,
        decoration: BoxDecoration(
          color: isActive ? AppColors.colorFED5E4LightBlue : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              smile,
              style: AppTextStyles.s24W600(),
            ),
            const Spacer(),
            Text(
              feel,
              style: AppTextStyles.s12W400(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
