import 'package:healthy_mind/feature/logic/models/memories_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class MemoriesRepo {
  Future<List<MemoriesHiveModel>> getMemories();
  Future<void> setMemories(MemoriesHiveModel memoriesHiveModel);
  Future<void> deleteMemories(int id);
}

class MemoriesRepoImpl implements MemoriesRepo {
  @override
  Future<List<MemoriesHiveModel>> getMemories() async {
    final memoriesBox = await Hive.openBox<MemoriesHiveModel>('memoriesBox');
    return memoriesBox.values.toList();
  }

  @override
  Future<void> setMemories(MemoriesHiveModel memoriesHiveModel) async {
    final memoriesBox = await Hive.openBox<MemoriesHiveModel>('memoriesBox');
    await memoriesBox.add(memoriesHiveModel);
  }

  @override
  deleteMemories(int id) async {
    final memoriesBox = await Hive.openBox<MemoriesHiveModel>('memoriesBox');
    final memoriesModel =
        memoriesBox.values.toList().singleWhere((e) => e.id == id);
    await memoriesModel.delete();
    await memoriesBox.compact();
  }
}
