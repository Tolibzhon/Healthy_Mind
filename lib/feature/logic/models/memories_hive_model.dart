// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'memories_hive_model.g.dart';

@HiveType(typeId: 1)
class MemoriesHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String event;
  @HiveField(3)
  String emotions;
  @HiveField(4)
  String importantPoints;
  @HiveField(5)
  String conclusion;
  @HiveField(6)
  String image;
  @HiveField(7)
  String date;

  MemoriesHiveModel({
    required this.id,
    required this.title,
    required this.event,
    required this.emotions,
    required this.importantPoints,
    required this.conclusion,
    required this.image,
    required this.date,
  });
}
