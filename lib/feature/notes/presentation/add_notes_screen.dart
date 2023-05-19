import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/widgets/custom_text_field.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Note',
          style: AppTextStyles.s20W600(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Sunday, May 12',
                  style: AppTextStyles.s24W600(color: Colors.black),
                ),
              ),
              const CustomTextField(
                hintText: 'Title',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                borderColor: Colors.transparent,
              ),
              Text(
                'Happy moments',
                style: AppTextStyles.s20W500(color: Colors.black),
              ),
              const CustomTextField(
                maxLines: 2,
                hintText: 'Text',
                borderColor: Colors.transparent,
              ),
              Text(
                'Grateful for',
                style: AppTextStyles.s20W500(color: Colors.black),
              ),
              const CustomTextField(
                maxLines: 2,
                hintText: 'Text',
                borderColor: Colors.transparent,
              ),
              Text(
                'My thoughts',
                style: AppTextStyles.s20W500(color: Colors.black),
              ),
              const CustomTextField(
                maxLines: 2,
                hintText: 'Text',
                borderColor: Colors.transparent,
              ),
              Center(
                child: Text(
                  'Add photo +',
                  style:
                      AppTextStyles.s20W500(color: AppColors.color38B6FFBLue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
