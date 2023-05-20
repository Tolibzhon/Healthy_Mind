import 'package:healthy_mind/feature/logic/models/note_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class NoteRepo {
  Future<List<NoteHiveModel>> getNote();
  Future<void> setNote(NoteHiveModel noteHiveModel);
  Future<void> deleteNote(int id);
}

class NoteRepoImpl implements NoteRepo {
  @override
  Future<List<NoteHiveModel>> getNote() async {
    final noteBox = await Hive.openBox<NoteHiveModel>('noteBox');
    return noteBox.values.toList();
  }

  @override
  Future<void> setNote(NoteHiveModel noteHiveModel) async {
    final noteBox = await Hive.openBox<NoteHiveModel>('noteBox');
    await noteBox.add(noteHiveModel);
  }

  @override
  deleteNote(int id) async {
    final noteBox = await Hive.openBox<NoteHiveModel>('noteBox');
    final noteModel = noteBox.values.toList()[id];
    await noteModel.delete();
    await noteBox.compact();
  }
}
