import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind/feature/logic/cubits/delete_memories_cubit/delete_memories_cubit.dart';
import 'package:healthy_mind/feature/logic/cubits/get_memories_cubit/get_memories_cubit.dart';
import 'package:healthy_mind/feature/logic/models/memories_hive_model.dart';
import 'package:healthy_mind/feature/logic/repositories/memories_repo.dart';
import 'package:healthy_mind/feature/memories/presentation/detaile_memories_screen.dart';
import 'package:healthy_mind/feature/widgets/spaces.dart';
import 'package:healthy_mind/feature/widgets/styled_toasts.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class WidgetMemoriesContainer extends StatelessWidget {
  const WidgetMemoriesContainer({
    super.key,
    required this.model,
  });
  final MemoriesHiveModel model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteMemoriesCubit(MemoriesRepoImpl()),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetaileMemoriesScreen(
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
                  BlocConsumer<DeleteMemoriesCubit, DeleteMemoriesState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: () {
                          showSuccessSnackBar('Deleted!');
                          context.read<GetMemoriesCubit>().getMemories();
                        },
                      );
                    },
                    builder: (context, state) {
                      return PopupMenuButton(
                        position: PopupMenuPosition.under,
                        icon: Image.asset(
                          AppImages.moreIcon,
                          width: 20,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            onTap: () async {
                              // context
                              //     .read<DeleteMemoriesCubit>()
                              //     .delete(model.id);
                              // Navigator.of(context).pop();

                              // print('aaaaaaa${model.id}');
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 90,
                                  height: 20,
                                  child: Text(
                                    "Delete",
                                    style: AppTextStyles.s20W400(
                                        color: Colors.black),
                                  ),
                                ),
                                const Icon(Icons.close)
                              ],
                            ),
                          ),
                        ],
                      );
                      // PopupMenuButton(
                      //     icon: Image.asset(
                      //       AppImages.moreIcon,
                      //       width: 20,
                      //     ),
                      //     onSelected: (value) {
                      //       context
                      //           .read<DeleteMemoriesCubit>()
                      //           .delete(model.id);
                      //     },
                      //     itemBuilder: (context) {
                      //       return <PopupMenuEntry>[
                      //         PopupMenuItem(
                      //             child: InkWell(
                      //                 onTap: () {
                      //                   context
                      //                       .read<DeleteMemoriesCubit>()
                      //                       .delete(model.id);
                      //                   Navigator.of(context).pop();

                      //                   print('aaaaaaa${model.id}');
                      //                 },
                      //                 child: Text('Close')))
                      //       ];
                      //     });
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
