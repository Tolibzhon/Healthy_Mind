import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/home/presentation/feel_screen.dart';
import 'package:healthy_mind/feature/home/presentation/quotes_screen.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'Home',
            style: AppTextStyles.s20W600(color: Colors.black),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'How do you feel ?',
              style: AppTextStyles.s24W600(color: AppColors.color38B6FFBLue),
            ),
          ),
          Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  AppImages.feeling,
                  width: 188,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FeelScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    AppImages.addIcon,
                    width: 50,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(AppImages.containBgImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Find direction to keep trying, even when it seems like no progress is being made',
                  style: AppTextStyles.s16W300(color: Colors.black),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuotesScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 30,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'More qoutes',
                        style: AppTextStyles.s12W400(
                          color: AppColors.color38B6FFBLue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Your last Notes',
            style: AppTextStyles.s20W600(color: Colors.black),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.diaryIcon,
                    width: 50,
                  ),
                  Text(
                    'You don`t have any notes yet',
                    style: AppTextStyles.s14W400(
                        color: Colors.black.withOpacity(0.6)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    )));
  }
}
