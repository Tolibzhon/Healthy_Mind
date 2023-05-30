import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/articles/presentation/play_screen.dart';
import 'package:healthy_mind/feature/widgets/spaces.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';
import 'package:share_plus/share_plus.dart';

class DetailArticlesScreen extends StatelessWidget {
  const DetailArticlesScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.music});
  final String image;
  final String title;
  final String subtitle;
  final String music;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: getWidth(context),
              height: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 39),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          AppImages.backButton,
                          width: 35,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Share.shareFiles([image], text: title);
                        },
                        child: Image.asset(
                          AppImages.shareButton,
                          width: 35,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              title,
              style: AppTextStyles.s24W500(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.s16W400(),
              ),
            ),
            const SizedBox(height: 80),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlayScreen(
                            mp3: music,
                            image: image,
                            title: title,
                          )),
                );
              },
              child: Image.asset(AppImages.musicIcon, width: 50),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
