// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'note_hive_model.g.dart';

@HiveType(typeId: 2)
class NoteHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String happyMoments;
  @HiveField(3)
  String gratefulFor;
  @HiveField(4)
  String myThoughts;
  @HiveField(5)
  String image;
  @HiveField(6)
  String date;

  NoteHiveModel({
    required this.id,
    required this.title,
    required this.happyMoments,
    required this.gratefulFor,
    required this.myThoughts,
    required this.image,
    required this.date,
  });
}
