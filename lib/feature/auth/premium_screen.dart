import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthy_mind/config/app_url.dart';
import 'package:healthy_mind/config/premium.dart';
import 'package:healthy_mind/feature/settings/presentation/privacy_policy_screen.dart';
import 'package:healthy_mind/feature/settings/presentation/term_screen.dart';
import 'package:healthy_mind/feature/widgets/buttom_navigator.dart';
import 'package:healthy_mind/feature/widgets/custom_button.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PremiumScreen extends StatelessWidget {
  PremiumScreen({super.key, this.isPop = false});
  bool isPop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color38B6FFBLue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 64,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 25,
                ),
                Image.asset(
                  AppImages.premiumHead,
                  width: 60,
                ),
                InkWell(
                    onTap: () {
                      if (isPop) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavigatorScreen(),
                          ),
                          (protected) => false,
                        );
                      }
                    },
                    child: Image.asset(
                      AppImages.closeIcon,
                      width: 30,
                    )),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Try Premium',
              style: AppTextStyles.s20W600(color: Colors.white),
            ),
            const SizedBox(height: 60),
            Text(
              'Get All Features Access! 🤩',
              style: AppTextStyles.s32W500(color: Colors.white),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Image.asset(
                  AppImages.checkIcon,
                  width: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Unlimited Memorise creation',
                  style: AppTextStyles.s20W500(color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Image.asset(
                  AppImages.checkIcon,
                  width: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Add photos to your notes',
                  style: AppTextStyles.s20W500(color: Colors.white),
                )
              ],
            ),
            const Spacer(),
            CustomButton(
              onPressed: () async {
                // var paywalls = await Apphud.paywalls();
                // await Apphud.purchase(
                //   product: paywalls?.paywalls.first.products!.first,
                // ).whenComplete(
                //   () async {
                //     if (await Apphud.hasActiveSubscription() ||
                //         await Apphud.hasPremiumAccess()) {
                await Premium.setSubscrp();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavigatorScreen(),
                  ),
                  (route) => false,
                );
                //     }
                //   },
                // );
              },
              text: 'Buy premium for \$1,50',
            ),
            const SizedBox(height: 40),
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
                    style: AppTextStyles.s14W400(
                        color: AppColors.colorFED5E4LightBlue),
                  ),
                ),
                Container(
                  height: 8,
                  width: 1,
                  color: AppColors.colorFED5E4LightBlue,
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
                    style: AppTextStyles.s14W400(
                        color: AppColors.colorFED5E4LightBlue),
                  ),
                ),
                Container(
                  height: 8,
                  width: 1,
                  color: AppColors.colorFED5E4LightBlue,
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
                    style: AppTextStyles.s14W400(
                        color: AppColors.colorFED5E4LightBlue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
