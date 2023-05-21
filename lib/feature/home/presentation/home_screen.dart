import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind/feature/home/presentation/feel_screen.dart';
import 'package:healthy_mind/feature/home/presentation/quotes_screen.dart';
import 'package:healthy_mind/feature/logic/cubits/get_note_cubit/get_note_cubit.dart';
import 'package:healthy_mind/feature/notes/presentation/widget/widge_notes_container.dart';
import 'package:healthy_mind/feature/widgets/app_error_text.dart';
import 'package:healthy_mind/feature/widgets/app_indicator.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';
import 'package:healthy_mind/helpers/saved_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<GetNoteCubit>().getNote();
    // SavedData.getTextSmileDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Home',
              style: AppTextStyles.s20W600(color: Colors.black),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'How do you feel ?',
                style: AppTextStyles.s24W600(color: AppColors.color38B6FFBLue),
              ),
            ),
            Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    AppImages.feeling,
                    width: 188,
                  ),
                  FutureBuilder(
                    future: SavedData.getSmileDate(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.isNotEmpty) {
                          return InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FeelScreen(),
                                ),
                              );
                              setState(() {});
                            },
                            child: Text(snapshot.data ?? '',
                                style: const TextStyle(
                                  fontSize: 90,
                                )),
                          );
                        }
                      }
                      return InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FeelScreen(),
                            ),
                          );
                          setState(() {});
                        },
                        child: Image.asset(
                          AppImages.addIcon,
                          width: 50,
                        ),
                      );
                    },
                  ),
                  FutureBuilder(
                    future: SavedData.getTextSmileDate(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.isNotEmpty) {
                          return Positioned(
                            bottom: 2,
                            child: Text(
                              snapshot.data ?? '',
                              style: AppTextStyles.s20W600(color: Colors.black),
                            ),
                          );
                        }
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage(AppImages.containBgImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  FutureBuilder(
                    future: SavedData.getQuotesDate(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.isNotEmpty) {
                          return Text(
                            snapshot.data ?? '',
                            style: AppTextStyles.s16W300(color: Colors.black),
                          );
                        }
                      }
                      return Text(
                        'Find direction to keep trying, even when it seems like no progress is being made',
                        style: AppTextStyles.s16W300(color: Colors.black),
                      );
                    },
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuotesScreen(),
                        ),
                      );
                      setState(() {});
                    },
                    child: Container(
                      height: 30,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'More qoutes',
                          style: AppTextStyles.s12W400(
                            color: AppColors.color38B6FFBLue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Your last Notes',
              style: AppTextStyles.s20W600(color: Colors.black),
            ),
            SizedBox(height: 16),
            BlocBuilder<GetNoteCubit, GetNoteState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const AppIndicator(),
                  loading: () => const AppIndicator(),
                  error: (error) => AppErrorText(error: error),
                  success: (model) => model.isNotEmpty
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: model.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) => WidgetNotesContainer(
                                model: model[index],
                              ))
                      : Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImages.diaryIcon,
                                  width: 50,
                                ),
                                Text(
                                  'You don`t have any notes yet',
                                  style: AppTextStyles.s14W400(
                                      color: Colors.black.withOpacity(0.6)),
                                )
                              ],
                            ),
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    )));
  }
}
