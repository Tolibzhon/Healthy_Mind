import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind/feature/logic/cubits/delete_memories_cubit/delete_memories_cubit.dart';
import 'package:healthy_mind/feature/logic/cubits/delete_note_cubit/delete_note_cubit.dart';
import 'package:healthy_mind/feature/logic/models/note_hive_model.dart';
import 'package:healthy_mind/feature/logic/repositories/memories_repo.dart';
import 'package:healthy_mind/feature/logic/repositories/note_repo.dart';
import 'package:healthy_mind/feature/notes/presentation/detaile_notes_screen.dart';
import 'package:healthy_mind/feature/widgets/spaces.dart';
import 'package:healthy_mind/feature/widgets/styled_toasts.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class WidgetNotesContainer extends StatelessWidget {
  const WidgetNotesContainer({super.key, required this.model});
  final NoteHiveModel model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteNoteCubit(NoteRepoImpl()),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetaileNotesScreen(
                model: model,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          height: 100,
          width: getWidth(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.color38B6FFBLue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    model.title,
                    style: AppTextStyles.s20W500(color: Colors.white),
                  ),
                  const Spacer(),
                  BlocConsumer<DeleteNoteCubit, DeleteNoteState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: () {
                          showSuccessSnackBar('Deleted!');
                        },
                      );
                    },
                    builder: (context, state) {
                      return PopupMenuItem(
                          child: InkWell(
                              onTap: () {
                                context
                                    .read<DeleteMemoriesCubit>()
                                    .delete(model.id);
                                Navigator.of(context).pop();

                                print('aaaaaaa${model.id}');
                              },
                              child: Text('Close')));
                    },
                  ),
                ],
              ),
              Text(
                model.date,
                style: AppTextStyles.s15W400(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
