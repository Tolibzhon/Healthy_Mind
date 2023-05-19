import 'package:flutter/material.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class DetaileNotesScreen extends StatelessWidget {
  const DetaileNotesScreen({super.key});

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
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Another happy day!',
                  style: AppTextStyles.s24W600(color: Colors.black),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Happy moments',
                style: AppTextStyles.s20W500(color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                'I was given a cool gift that I did not even dream of',
                style: AppTextStyles.s16W400(color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text(
                'Grateful for',
                style: AppTextStyles.s20W500(color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                'I am grateful for the fact that I am surrounded by kind and sincere people',
                style: AppTextStyles.s16W400(color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text(
                'My thoughts',
                style: AppTextStyles.s20W500(color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                'I had a wonderful and productive day today. I am on step closer to my goals.',
                style: AppTextStyles.s16W400(color: Colors.black),
              ),
              const SizedBox(height: 20),
              Image.asset(AppImages.image23)
            ],
          ),
        ),
      ),
    );
  }
}
