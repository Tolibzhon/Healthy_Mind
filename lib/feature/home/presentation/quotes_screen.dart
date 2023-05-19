import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/home/presentation/widget/widget_quotes_container.dart';
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
      body: Expanded(
        child: ListView.separated(
          itemCount: _quotesList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) => WidgetQuotesContainer(
            isActive: quotes == _quotesList[index],
            onTap: () {
              setState(() {
                quotes = _quotesList[index];
              });
            },
            quotes: _quotesList[index],
          ),
        ),
      ),
    );
  }
}

List<String> _quotesList = [
  'Find',
  'Happy',
  'Joyful',
];
