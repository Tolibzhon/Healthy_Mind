import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/notes/presentation/add_notes_screen.dart';
import 'package:healthy_mind/feature/notes/presentation/widget/widge_notes_container.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

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
              Row(
                children: [
                  Text(
                    'Notes',
                    style: AppTextStyles.s20W600(color: Colors.black),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddNotesScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      AppImages.addIcon,
                      width: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Document your life - daily happenings,\nspecial occasions, and reflections\non your goals.',
                style: AppTextStyles.s14W400(color: Colors.black),
              ),
              const Divider(
                color: Colors.black,
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: 3,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) => const WidgetNotesContainer(
                          title: 'Another happy day!',
                          date: 'May 12, 2023',
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
