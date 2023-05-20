import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/home/presentation/widget/widget_feel_container.dart';
import 'package:healthy_mind/feature/widgets/custom_button.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class FeelScreen extends StatefulWidget {
  const FeelScreen({super.key});

  @override
  State<FeelScreen> createState() => _FeelScreenState();
}

class _FeelScreenState extends State<FeelScreen> {
  String feel = '';
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
          'How do you feel?',
          style: AppTextStyles.s20W600(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  AppImages.feeling,
                  width: 188,
                ),
                const SizedBox(),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Which word describe your feeling best? ',
              style: AppTextStyles.s16W400(color: Colors.black),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 70),
                itemBuilder: (context, index) => WidgetFeelContainer(
                  isActive: feel == _feelList[index],
                  feel: _feelList[index],
                  onTap: () {
                    setState(() {
                      feel = _feelList[index];
                    });
                  },
                  smile: _smileList[index],
                ),
                itemCount: _feelList.length,
              ),
            ),
            const Spacer(),
            CustomButton(
                onPressed: () async {
                  print(feel);
                },
                text: 'Save'),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

List<String> _feelList = [
  'Lovely',
  'Happy',
  'Joyful',
  'Admire',
  'Sad',
  'Angry',
  'Stressed',
  'Loved',
];
List<String> _smileList = [
  '🥰',
  '😀',
  '😗',
  '🤩',
  '🙁',
  '😠',
  '🤯',
  '😍',
];
