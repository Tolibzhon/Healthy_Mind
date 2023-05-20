import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind/config/premium.dart';
import 'package:healthy_mind/feature/auth/premium_screen.dart';
import 'package:healthy_mind/feature/logic/cubits/get_note_cubit/get_note_cubit.dart';
import 'package:healthy_mind/feature/logic/cubits/set_note_cubit/set_note_cubit.dart';
import 'package:healthy_mind/feature/logic/models/note_hive_model.dart';
import 'package:healthy_mind/feature/logic/repositories/note_repo.dart';
import 'package:healthy_mind/feature/widgets/custom_button.dart';
import 'package:healthy_mind/feature/widgets/custom_text_field.dart';
import 'package:healthy_mind/feature/widgets/spaces.dart';
import 'package:healthy_mind/feature/widgets/styled_toasts.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  late TextEditingController _titleController;
  late TextEditingController _happyMomentsController;
  late TextEditingController _gratefulForController;
  late TextEditingController _myThoughtsController;
  late final String _date = DateFormat('EEEE, MMMM d').format(DateTime.now());
  //String _dateB = DateFormat('MMMM dd, yyyy').format(DateTime.now());

  File? _image;
  Uint8List? _bytes;
  String sss = '';

  @override
  void initState() {
    _titleController = TextEditingController();
    _happyMomentsController = TextEditingController();
    _gratefulForController = TextEditingController();
    _myThoughtsController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _happyMomentsController.dispose();
    _gratefulForController.dispose();
    _myThoughtsController.dispose();
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
          'Note',
          style: AppTextStyles.s20W600(color: Colors.black),
        ),
      ),
      body: BlocProvider(
        create: (context) => SetNoteCubit(
          NoteRepoImpl(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    _date,
                    style: AppTextStyles.s24W600(color: Colors.black),
                  ),
                ),
                CustomTextField(
                  controller: _titleController,
                  hintText: 'Title',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                  borderColor: Colors.transparent,
                ),
                Text(
                  'Happy moments',
                  style: AppTextStyles.s20W500(color: Colors.black),
                ),
                CustomTextField(
                  controller: _happyMomentsController,
                  maxLines: 2,
                  hintText: 'Text',
                  borderColor: Colors.transparent,
                ),
                Text(
                  'Grateful for',
                  style: AppTextStyles.s20W500(color: Colors.black),
                ),
                CustomTextField(
                  controller: _gratefulForController,
                  maxLines: 2,
                  hintText: 'Text',
                  borderColor: Colors.transparent,
                ),
                Text(
                  'My thoughts',
                  style: AppTextStyles.s20W500(color: Colors.black),
                ),
                CustomTextField(
                  controller: _myThoughtsController,
                  maxLines: 2,
                  hintText: 'Text',
                  borderColor: Colors.transparent,
                ),
                _image == null
                    ? GestureDetector(
                        onTap: () async {
                          final isBuy = await Premium.getSubscrp();
                          if (!isBuy) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PremiumScreen(),
                              ),
                              (protected) => false,
                            );
                          } else {
                            pickImage(ImageSource.gallery);
                          }
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
                  child: BlocConsumer<SetNoteCubit, SetNoteState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: () {
                          Navigator.pop(context);
                          context.read<GetNoteCubit>().getNote();
                        },
                      );
                    },
                    builder: (context, state) {
                      return CustomButton(
                        isLoading: state.isLoading,
                        onPressed: () {
                          if (_titleController.text.isNotEmpty &&
                              _happyMomentsController.text.isNotEmpty &&
                              _gratefulForController.text.isNotEmpty &&
                              _myThoughtsController.text.isNotEmpty &&
                              _bytes != null) {
                            final noteHiveModel = NoteHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: _titleController.text,
                              happyMoments: _happyMomentsController.text,
                              gratefulFor: _gratefulForController.text,
                              myThoughts: _myThoughtsController.text,
                              image: sss, //_bytes,
                              date: _date,
                            );
                            context.read<SetNoteCubit>().setNote(noteHiveModel);
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
