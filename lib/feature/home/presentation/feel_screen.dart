import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/home/presentation/widget/widget_feel_container.dart';
import 'package:healthy_mind/feature/widgets/custom_button.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';
import 'package:healthy_mind/helpers/saved_data.dart';

class FeelScreen extends StatefulWidget {
  const FeelScreen({super.key});

  @override
  State<FeelScreen> createState() => _FeelScreenState();
}

class _FeelScreenState extends State<FeelScreen> {
  int _index = 0;
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
                Text(
                  _smileList[_index],
                  style: const TextStyle(
                    fontSize: 90,
                  ),
                ),
                Positioned(
                  bottom: 2,
                  child: Text(
                    _feelList[_index],
                    style: AppTextStyles.s20W600(color: Colors.black),
                  ),
                ),
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
                  isActive: _index == index,
                  feel: _feelList[index],
                  onTap: () {
                    setState(() {
                      _index = index;
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
                  await SavedData.setSmileDate(
                    _smileList[_index],
                  );
                  await SavedData.setTextSmileDate(
                    _feelList[_index],
                  );
                  Navigator.pop(context);
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
