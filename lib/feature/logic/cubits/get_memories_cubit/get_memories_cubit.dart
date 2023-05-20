import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthy_mind/feature/logic/models/memories_hive_model.dart';
import 'package:healthy_mind/feature/logic/repositories/memories_repo.dart';

part 'get_memories_state.dart';
part 'get_memories_cubit.freezed.dart';

class GetMemoriesCubit extends Cubit<GetMemoriesState> {
  GetMemoriesCubit(this.repo) : super(const GetMemoriesState.loading());

  final MemoriesRepo repo;

  getMemories() async {
    try {
      final memoriesList = await repo.getMemories();
      emit(GetMemoriesState.success(memoriesList));
    } catch (e) {
      emit(GetMemoriesState.error(e.toString()));
    }
  }
}
