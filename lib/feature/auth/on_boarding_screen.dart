import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthy_mind/config/app_url.dart';
import 'package:healthy_mind/config/premium.dart';
import 'package:healthy_mind/feature/auth/premium_screen.dart';
import 'package:healthy_mind/feature/settings/presentation/privacy_policy_screen.dart';
import 'package:healthy_mind/feature/settings/presentation/term_screen.dart';
import 'package:healthy_mind/feature/widgets/buttom_navigator.dart';
import 'package:healthy_mind/feature/widgets/custom_button.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  int currantPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    currantPage = value;
                  });
                },
                controller: controller,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 14),
                      Image.asset(
                        AppImages.pageviwe1,
                        width: 280,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Healthy Mind',
                        style: AppTextStyles.s36W500(color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Stop and take care of your mental health, get rid of anxiety and negative emotions.',
                        style: AppTextStyles.s20W400(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      Image.asset(AppImages.pageviwe2),
                      const SizedBox(height: 30),
                      Text(
                        'Personal Notes',
                        style: AppTextStyles.s36W500(color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Write down your thoughts and highlights that happened during the day.',
                        style: AppTextStyles.s20W400(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      Image.asset(AppImages.pageviwe3),
                      const SizedBox(height: 30),
                      Text(
                        'Mindful Learning',
                        style: AppTextStyles.s36W500(color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Support your mood tracking with suitable exercises and articles in the library.',
                        style: AppTextStyles.s20W400(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                radius: 8,
                dotWidth: 8,
                dotHeight: 8,
                activeDotColor: Theme.of(context).primaryColor,
                dotColor: Theme.of(context).primaryColor.withOpacity(0.3),
              ),
              onDotClicked: (index) {},
            ),
            SafeArea(
              child: CustomButton(
                text: 'Next',
                textColor: Colors.white,
                onPressed: () async {
                  final isBuy = await Premium.getSubscrp();
                  if (currantPage == 2) {
                    if (!isBuy) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PremiumScreen(),
                        ),
                        (protected) => false,
                      );
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavigatorScreen(),
                        ),
                        (protected) => false,
                      );
                    }
                  } else {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Terms of Service',
                    style: AppTextStyles.s14W400(color: Colors.grey),
                  ),
                ),
                Container(
                  height: 8,
                  width: 1,
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () async {
                    final hasPremiumAccess = await Apphud.hasPremiumAccess();
                    final hasActiveSubscription =
                        await Apphud.hasActiveSubscription();
                    if (hasPremiumAccess || hasActiveSubscription) {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool("ISBUY", true);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Success!'),
                          content:
                              const Text('Your purchase has been restored!'),
                          actions: [
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.popUntil(
                                    context, (route) => route.isFirst);
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Restore purchase'),
                          content: const Text(
                              'Your purchase is not found.\nSupport: ${AppUrl.supportForm}'),
                          actions: [
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: () => {Navigator.of(context).pop()},
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Restore',
                    style: AppTextStyles.s14W400(color: Colors.grey),
                  ),
                ),
                Container(
                  height: 8,
                  width: 1,
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Privacy Policy',
                    style: AppTextStyles.s14W400(color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
