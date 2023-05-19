import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthy_mind/config/app_url.dart';
import 'package:healthy_mind/feature/settings/presentation/privacy_policy_screen.dart';
import 'package:healthy_mind/feature/settings/presentation/term_screen.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 64),
            Text(
              "Settings",
              style: AppTextStyles.s20W600(color: Colors.black),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 7,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Privacy Policy',
                          style: AppTextStyles.s16W400(color: Colors.black),
                        ),
                        const Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TermScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Term of Use',
                          style: AppTextStyles.s16W400(color: Colors.black),
                        ),
                        const Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
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
                          builder: (BuildContext context) =>
                              CupertinoAlertDialog(
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
                          builder: (BuildContext context) =>
                              CupertinoAlertDialog(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Restore',
                          style: AppTextStyles.s16W400(color: Colors.black),
                        ),
                        const Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
