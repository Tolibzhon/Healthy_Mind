import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind/feature/logic/cubits/delete_memories_cubit/delete_memories_cubit.dart';
import 'package:healthy_mind/feature/logic/cubits/get_note_cubit/get_note_cubit.dart';
import 'package:healthy_mind/feature/logic/repositories/memories_repo.dart';
import 'package:healthy_mind/feature/notes/presentation/add_notes_screen.dart';
import 'package:healthy_mind/feature/notes/presentation/widget/widge_notes_container.dart';
import 'package:healthy_mind/feature/widgets/app_error_text.dart';
import 'package:healthy_mind/feature/widgets/app_indicator.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    context.read<GetNoteCubit>().getNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => DeleteMemoriesCubit(MemoriesRepoImpl()),
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
                BlocBuilder<GetNoteCubit, GetNoteState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                        orElse: () => const AppIndicator(),
                        loading: () => const AppIndicator(),
                        error: (error) => AppErrorText(error: error),
                        success: (model) => model.isNotEmpty
                            ? Expanded(
                                child: ListView.separated(
                                    itemCount: model.length,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 12),
                                    itemBuilder: (context, index) =>
                                        WidgetNotesContainer(
                                          model: model[index],
                                        )),
                              )
                            : const Center(
                                child: Text('Empty'),
                              ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
