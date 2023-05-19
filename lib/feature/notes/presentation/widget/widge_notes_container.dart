import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/notes/presentation/detaile_notes_screen.dart';
import 'package:healthy_mind/feature/widgets/spaces.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class WidgetNotesContainer extends StatelessWidget {
  const WidgetNotesContainer(
      {super.key, required this.title, required this.date});
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetaileNotesScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 80,
        width: getWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.color38B6FFBLue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: AppTextStyles.s20W500(color: Colors.white),
                ),
                const Spacer(),
                Image.asset(
                  AppImages.moreIcon,
                  width: 20,
                ),
              ],
            ),
            Text(
              date,
              style: AppTextStyles.s15W400(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
