import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind/feature/logic/cubits/get_memories_cubit/get_memories_cubit.dart';
import 'package:healthy_mind/feature/logic/cubits/set_memories_cubit/set_memories_cubit.dart';
import 'package:healthy_mind/feature/logic/models/memories_hive_model.dart';
import 'package:healthy_mind/feature/logic/repositories/memories_repo.dart';
import 'package:healthy_mind/feature/widgets/custom_button.dart';
import 'package:healthy_mind/feature/widgets/custom_text_field.dart';
import 'package:healthy_mind/feature/widgets/spaces.dart';
import 'package:healthy_mind/feature/widgets/styled_toasts.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class AddMemoriesScreen extends StatefulWidget {
  const AddMemoriesScreen({super.key});

  @override
  State<AddMemoriesScreen> createState() => _AddMemoriesScreenState();
}

class _AddMemoriesScreenState extends State<AddMemoriesScreen> {
  late TextEditingController _titleController;
  late TextEditingController _eventMomentsController;
  late TextEditingController _emotionsForController;
  late TextEditingController _importantPointsController;
  late TextEditingController _conclusionPointsController;
  String _date = DateFormat('EEEE, MMMM d').format(DateTime.now());

  File? _image;
  Uint8List? _bytes;
  String sss = '';

//   String s = String.fromCharCodes(inputAsUint8List);
// var outputAsUint8List = Uint8List.fromList(s.codeUnits);

  @override
  void initState() {
    _titleController = TextEditingController();
    _eventMomentsController = TextEditingController();
    _emotionsForController = TextEditingController();
    _importantPointsController = TextEditingController();
    _conclusionPointsController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose;
    _eventMomentsController.dispose;
    _emotionsForController.dispose;
    _importantPointsController.dispose;
    _conclusionPointsController.dispose;
    super.dispose();
  }

  Future pickImage(ImageSource source) async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile == null) return null;
      setState(() => _image = File(pickedFile.path));
      _bytes = _image!.readAsBytesSync();
      sss = String.fromCharCodes(_bytes!);
      // var outputAsUint8List = Uint8List.fromList(s.codeUnits);
    } on PlatformException catch (e) {
      showErrorSnackBar('Failed to select image $e');
    }
  }

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
          'Add memory',
          style: AppTextStyles.s20W600(color: Colors.black),
        ),
      ),
      body: BlocProvider(
        create: (context) => SetMemoriesCubit(
          MemoriesRepoImpl(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  '1. Create a title',
                  style: AppTextStyles.s20W600(color: Colors.black),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _titleController,
                  borderColor: Colors.black,
                  hintText: 'Text',
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                Text(
                  '2. What happened',
                  style: AppTextStyles.s20W600(color: Colors.black),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _eventMomentsController,
                  borderColor: Colors.black,
                  hintText: 'Text',
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                Text(
                  '3. What emotions did you experience?',
                  style: AppTextStyles.s20W600(color: Colors.black),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _emotionsForController,
                  borderColor: Colors.black,
                  hintText: 'Text',
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                Text(
                  '4. What are the important points?',
                  style: AppTextStyles.s20W600(color: Colors.black),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _importantPointsController,
                  borderColor: Colors.black,
                  hintText: 'Text',
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                Text(
                  '5. What conclusion will you write?',
                  style: AppTextStyles.s20W600(color: Colors.black),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _conclusionPointsController,
                  borderColor: Colors.black,
                  hintText: 'Text',
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                Text(
                  '6. Choose a photo for this memory.',
                  style: AppTextStyles.s20W600(color: Colors.black),
                ),
                const SizedBox(height: 10),
                _image == null
                    ? GestureDetector(
                        onTap: () {
                          pickImage(ImageSource.gallery);
                        },
                        child: Center(
                          child: Text(
                            'Add photo +',
                            style: AppTextStyles.s20W500(
                                color: AppColors.color38B6FFBLue),
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.memory(
                          _bytes!,
                          width: getWidth(context),
                          height: 300,
                          fit: BoxFit.fill,
                        ),
                      ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BlocConsumer<SetMemoriesCubit, SetMemoriesState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: () {
                          Navigator.pop(context);
                          context.read<GetMemoriesCubit>().getMemories();
                        },
                      );
                    },
                    builder: (context, state) {
                      return CustomButton(
                        isLoading: state.isLoading,
                        onPressed: () {
                          if (_titleController.text.isNotEmpty &&
                              _eventMomentsController.text.isNotEmpty &&
                              _emotionsForController.text.isNotEmpty &&
                              _conclusionPointsController.text.isNotEmpty &&
                              _importantPointsController.text.isNotEmpty &&
                              _bytes != null) {
                            final memoriesHiveModel = MemoriesHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: _titleController.text,
                              event: _eventMomentsController.text,
                              emotions: _emotionsForController.text,
                              conclusion: _conclusionPointsController.text,
                              importantPoints: _importantPointsController.text,
                              image: sss,//_bytes,
                              date: _date,
                            );
                            context
                                .read<SetMemoriesCubit>()
                                .setMemories(memoriesHiveModel);
                          } else {
                            showErrorSnackBar('Fill in all the fields');
                          }
                        },
                        text: 'Save',
                        radius: 20,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
