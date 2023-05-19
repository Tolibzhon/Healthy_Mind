import 'package:flutter/material.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class DetaileMemoriesScreen extends StatelessWidget {
  const DetaileMemoriesScreen({super.key});

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
          'Memory',
          style: AppTextStyles.s20W600(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Friday, June 10',
                style: AppTextStyles.s24W600(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '1. Dinner in Positano',
              style: AppTextStyles.s16W400(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              '2. We dined at the best restaurant with the most beautiful view',
              style: AppTextStyles.s16W400(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              '3. I was very happy and grateful to be able to see such beauty.',
              style: AppTextStyles.s16W400(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              '4. It was my best decision to go to the South Italy. I met new people, ate delicious food and took beautiful photos.',
              style: AppTextStyles.s16W400(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              '5. I will definitely come here again!',
              style: AppTextStyles.s16W400(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              '6.',
              style: AppTextStyles.s16W400(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Image.asset(AppImages.image23),
          ],
        ),
      ),
    );
  }
}
