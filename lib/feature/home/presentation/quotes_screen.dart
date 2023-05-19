import 'package:flutter/material.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  String quotes = '';
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
          'Quotes',
          style: AppTextStyles.s20W600(color: Colors.black),
        ),
      ),
      // body: Expanded(
      //   child: ListView.separated(
      //     itemCount: _quotesList.length,
      //     separatorBuilder: (context, index) => const SizedBox(height: 12),
      //     itemBuilder: (context, index) => WidgetQuotesContainer(
      //       isActive: quotes == _quotesList[index],
      //       onTap: () {
      //         setState(() {
      //           quotes = _quotesList[index];
      //         });
      //       },
      //       quotes: _quotesList[index],
      //     ),
      //   ),
      // ),
    );
  }
}

List<String> _quotesList = [
  "Embrace the unknown with curiosity and let it paint your world in endless possibilities.",
  "In the midst of chaos, find solace in the beauty of your own resilience.",
  "The sun will rise again, and so will you. Keep moving forward.",
  "Let your dreams be your compass, guiding you towards a life of purpose.",
  "Strength lies not in the absence of fear, but in the courage to face it head-on.",
  "Dance to the rhythm of your own heartbeat and watch the world join your celebration.",
  "Life's challenges are merely stepping stones on the path to your true potential.",
  "When storms rage, remember that even the darkest clouds have a silver lining.",
  "The power to change your life lies within you. Unlock it and embrace your transformation.",
  "Life is a canvas; pick up your brush and paint it with colors that ignite your soul.",
];
