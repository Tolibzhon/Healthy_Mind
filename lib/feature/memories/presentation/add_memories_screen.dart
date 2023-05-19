import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/widgets/custom_button.dart';
import 'package:healthy_mind/feature/widgets/custom_text_field.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class AddMemoriesScreen extends StatelessWidget {
  const AddMemoriesScreen({super.key});

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
          'Add memory',
          style: AppTextStyles.s20W600(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                '1. Create a title',
                style: AppTextStyles.s20W600(color: Colors.black),
              ),
              const SizedBox(height: 10),
              const CustomTextField(
                borderColor: Colors.black,
                hintText: 'Text',
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              Text(
                '2. What happened',
                style: AppTextStyles.s20W600(color: Colors.black),
              ),
              const SizedBox(height: 10),
              const CustomTextField(
                borderColor: Colors.black,
                hintText: 'Text',
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              Text(
                '3. What emotions did you experience?',
                style: AppTextStyles.s20W600(color: Colors.black),
              ),
              const SizedBox(height: 10),
              const CustomTextField(
                borderColor: Colors.black,
                hintText: 'Text',
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              Text(
                '4. What are the important points?',
                style: AppTextStyles.s20W600(color: Colors.black),
              ),
              const SizedBox(height: 10),
              const CustomTextField(
                borderColor: Colors.black,
                hintText: 'Text',
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              Text(
                '5. What conclusion will you write?',
                style: AppTextStyles.s20W600(color: Colors.black),
              ),
              const SizedBox(height: 10),
              const CustomTextField(
                borderColor: Colors.black,
                hintText: 'Text',
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              Text(
                '6. Choose a photo for this memory.',
                style: AppTextStyles.s20W600(color: Colors.black),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Add photo +',
                  style:
                      AppTextStyles.s20W500(color: AppColors.color38B6FFBLue),
                ),
              ),
              const SizedBox(height: 130),
              const CustomButton(text: 'Save'),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
