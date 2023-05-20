import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthy_mind/feature/logic/models/memories_hive_model.dart';
import 'package:healthy_mind/feature/logic/repositories/memories_repo.dart';


part 'set_memories_state.dart';
part 'set_memories_cubit.freezed.dart';

class SetMemoriesCubit extends Cubit<SetMemoriesState> {
  SetMemoriesCubit(this.memoriesRepo,)
      : super(const SetMemoriesState.initial());

  final MemoriesRepo memoriesRepo;

  setMemories(MemoriesHiveModel memoriesHiveModel) async {
    emit(const SetMemoriesState.loading());
    try {
      await memoriesRepo.setMemories(memoriesHiveModel);
      emit(const SetMemoriesState.success());
    } catch (e) {
      emit(SetMemoriesState.error(e.toString()));
    }
  }

 
}
