import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/articles/presentation/detail_articles_screen.dart';
import 'package:healthy_mind/feature/articles/presentation/widget/widget_article_container.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

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
                'Articles',
                style: AppTextStyles.s20W600(color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                'Take care of you mental health. Read articles and listen to soothing sounds to deal with negative emotions.',
                style: AppTextStyles.s14W400(color: Colors.black),
              ),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                    itemCount: title.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) => WidgetArticleContainer(
                          image: image[index],
                          title: title[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailArticlesScreen(
                                    image: image[index],
                                    title: title[index],
                                    subtitle: subtitle[index],
                                    music: music[index]),
                              ),
                            );
                          },
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> title = [
  'How to get rid of anxiety',
  'Feel happy and alive',
  'How to deal with insomnia',
  'Be in the moment here and now',
  'Positive attitude for the day',
  'Conquer your fear',
  'Hear your true desires',
  'Breathing exercises before bed',
  'If you had a hard day',
  'Gratitude practice',
];

List<String> subtitle = [
  'Find peace and serenity within your own mind. This meditation is designed to help you quiet the constant chatter of your thoughts and find a sense of inner calm. Close your eyes, take a deep breath, and let go of any stress or tension as you focus on the present moment. ',
  'Try something new. This is like nothing else will help you stir yourself up. All people are naturally smart, but because of this, our brain always needs a stimulus. If we do the same thing day in and day out, we get bored and die inside. Do something interesting and life will seem completely different to you.',
  'Scientists believe that healthy sleep is a reflex mechanism. If a person went to bed and did not fall asleep after 15-20 minutes, do not lie further in it. Otherwise, this will lead to the formation of a new reflex: bed-insomnia. It is difficult to fall asleep in a stuffy and hot room. Therefore, if the question arose of how to fall asleep with insomnia, you need to open a window for ventilation.',
  'Sometimes the golden-orange rays of the setting sun, sparkling against the azure sky, give us a moment of such piercing beauty that we freeze in stunned, unable to look away. The splendor of the moment blinds us with its brilliance so much that our restless and chatty mind pauses, losing the ability to mentally carry us away from what is happening here and now. ',
  'Waking up in a good mood guarantees a great start to the day and a positive continuation of it. To do this, firstly, it is important to go to bed the night before not too late to get enough sleep. Use affirmations, exercise, make time for a delicious breakfast.',
  'To get rid of fear, you first need to recognize it. This is the most serious first step. Write them down, Feel your fear, Ask yourself: what is the worst thing that can happen? Celebrate every success! Even small achievements. Use this feeling of success to move forward and take the next step.',
  'On a piece of paper, write down in a row everything that you would do if you had the financial means to do it. limit the most urgent, the most important desires for you. Discarding those that directly depend on your well-being. Think about how to implement them gradually in your daily life, starting with your basic, most important need.',
  'Most techniques for facilitating the process of falling asleep involve slow, deep breaths in and out. Take a slow, deep breath in through your nose, keeping the hand on your chest still while the hand on your stomach rises with the breath. Exhale slowly through closed lips. Keep your face relaxed while breathing. Inhale and exhale counting to make sure you are breathing slowly. Focus on the sound of your breath.',
  'Today you had a hard day and I know that you are very tired. I will not bother with conversations, but simply wish you good night and a good rest! Gain strength for tomorrow! I wish my little beautiful girl a deep and sound sleep, so that in the morning there will be a great mood! ',
  'Life gives us so many reasons to be upset that the thought of gratitude does not even enter our heads. But if you think carefully, each of us will find something to say thank you for our lives and the people around us. If you do this practice systematically, it will be easier to cope with lifes difficulties. Write down in it everything for which you are grateful to life and people. You can do this daily, once a week or monthly.'
];
List<String> image = [
  AppImages.articlesImage1,
  AppImages.articlesImage2,
  AppImages.articlesImage3,
  AppImages.articlesImage4,
  AppImages.articlesImage5,
  AppImages.articlesImage6,
  AppImages.articlesImage7,
  AppImages.articlesImage8,
  AppImages.articlesImage9,
  AppImages.articlesImage10,
];
List<String> music = [
  'assets/music/music1.mp3',
  'assets/music/music2.mp3',
  'assets/music/music3.mp3',
  'assets/music/music4.mp3',
  'assets/music/music5.mp3',
  'assets/music/music6.mp3',
  'assets/music/music7.mp3',
  'assets/music/music8.mp3',
  'assets/music/music9.mp3',
  'assets/music/music10.mp3',
];
