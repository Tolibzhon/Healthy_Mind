import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthy_mind/feature/logic/models/memories_hive_model.dart';
import 'package:healthy_mind/feature/widgets/spaces.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class DetaileMemoriesScreen extends StatefulWidget {
  const DetaileMemoriesScreen({super.key, required this.model});
  final MemoriesHiveModel model;

  @override
  State<DetaileMemoriesScreen> createState() => _DetaileMemoriesScreenState();
}

class _DetaileMemoriesScreenState extends State<DetaileMemoriesScreen> {
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
          'Memory',
          style: AppTextStyles.s20W600(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text(
                widget.model.date,
                style: AppTextStyles.s24W600(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '1. ${widget.model.title}',
              style: AppTextStyles.s16W400(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              '2. ${widget.model.event}',
              style: AppTextStyles.s16W400(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              '3. ${widget.model.emotions}',
              style: AppTextStyles.s16W400(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              '4. ${widget.model.importantPoints}',
              style: AppTextStyles.s16W400(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              '5. ${widget.model.conclusion}',
              style: AppTextStyles.s16W400(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              '6.',
              style: AppTextStyles.s16W400(color: Colors.black),
            ),
            const SizedBox(height: 10),
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.memory(
                  outputAsUint8List,
                  width: getWidth(context),
                  height: 300,
                  fit: BoxFit.fill,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
