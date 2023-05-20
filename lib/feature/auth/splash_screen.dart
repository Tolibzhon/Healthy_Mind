import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/auth/on_boarding_screen.dart';
import 'package:healthy_mind/feature/widgets/spaces.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // SaveData.getColor().then((value) {
    //   final themeProvider = context.read<ThemeProvider>();
    //   themeProvider.chengeTheme(Color(value));
    // });
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        ),
        (protected) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height2 = getHeight(context);
    return const Scaffold(
      backgroundColor: Colors.white,
      // body: SizedBox(
      //   width: getWidth(context),
      //   // height: height2,
      //   child: Center(
      //     child: Image.asset(
      //       AppImages.splashImage,
      //       width: 100,
      //     ),
      //   ),
      // ),
    );
  }
}
