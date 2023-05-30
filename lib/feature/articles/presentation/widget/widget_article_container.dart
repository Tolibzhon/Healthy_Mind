import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/widgets/spaces.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class WidgetArticleContainer extends StatelessWidget {
  const WidgetArticleContainer(
      {super.key,
      required this.onTap,
      required this.image,
      required this.title});
  final Function() onTap;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 56),
        width: getWidth(context),
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          width: getWidth(context),
          height: 64,
          decoration: BoxDecoration(
            color: AppColors.color38B6FFBLue.withOpacity(0.6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.s20W600(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
