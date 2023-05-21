import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthy_mind/feature/logic/models/note_hive_model.dart';
import 'package:healthy_mind/feature/widgets/spaces.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class DetaileNotesScreen extends StatefulWidget {
  const DetaileNotesScreen({super.key, required this.model});
  final NoteHiveModel model;

  @override
  State<DetaileNotesScreen> createState() => _DetaileNotesScreenState();
}

class _DetaileNotesScreenState extends State<DetaileNotesScreen> {
  late Uint8List outputAsUint8List;
  @override
  void initState() {
    outputAsUint8List = Uint8List.fromList(widget.model.image.codeUnits);
    super.initState();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  widget.model.date,
                  style: AppTextStyles.s24W600(color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  widget.model.title,
                  style: AppTextStyles.s24W600(color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              widget.model.image != ''
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.memory(
                        outputAsUint8List,
                        width: getWidth(context),
                        height: 300,
                        fit: BoxFit.fill,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: 20),
              Text(
                'Happy moments',
                style: AppTextStyles.s20W500(color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                widget.model.happyMoments,
                style: AppTextStyles.s16W400(color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text(
                'Grateful for',
                style: AppTextStyles.s20W500(color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                widget.model.gratefulFor,
                style: AppTextStyles.s16W400(color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text(
                'My thoughts',
                style: AppTextStyles.s20W500(color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                widget.model.myThoughts,
                style: AppTextStyles.s16W400(color: Colors.black),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
