import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthy_mind/feature/logic/repositories/memories_repo.dart';

part 'delete_memories_state.dart';
part 'delete_memories_cubit.freezed.dart';

class DeleteMemoriesCubit extends Cubit<DeleteMemoriesState> {
  DeleteMemoriesCubit(this.repo) : super(const DeleteMemoriesState.initial());

  final MemoriesRepo repo;

  delete(int id) async {
    emit(const DeleteMemoriesState.loading());
    try {
      await repo.deleteMemories(id);
      emit(const DeleteMemoriesState.success());
    } catch (e) {
      emit(DeleteMemoriesState.error(e.toString()));
    }
  }
}
