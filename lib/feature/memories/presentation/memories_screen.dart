import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind/feature/logic/cubits/get_memories_cubit/get_memories_cubit.dart';
import 'package:healthy_mind/feature/memories/presentation/add_memories_screen.dart';
import 'package:healthy_mind/feature/memories/presentation/widget/widge_memories_container.dart';
import 'package:healthy_mind/feature/widgets/app_error_text.dart';
import 'package:healthy_mind/feature/widgets/app_indicator.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class MemoriesScreen extends StatefulWidget {
  const MemoriesScreen({super.key});

  @override
  State<MemoriesScreen> createState() => _MemoriesScreenState();
}

class _MemoriesScreenState extends State<MemoriesScreen> {
  @override
  void initState() {
    context.read<GetMemoriesCubit>().getMemories();
    super.initState();
  }

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
                    'Memories',
                    style: AppTextStyles.s20W600(color: Colors.black),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddMemoriesScreen(),
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
                'Record your happy moments in life spent\nwith family, friends, loved ones. Describe\nyour emotions to always remember them.',
                style: AppTextStyles.s14W400(color: Colors.black),
              ),
              const Divider(
                color: Colors.black,
              ),
              BlocBuilder<GetMemoriesCubit, GetMemoriesState>(
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
                                      WidgetMemoriesContainer(
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
    );
  }
}
