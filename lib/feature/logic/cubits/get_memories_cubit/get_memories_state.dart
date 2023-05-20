part of 'get_memories_cubit.dart';

@freezed
class GetMemoriesState with _$GetMemoriesState {
  const factory GetMemoriesState.loading() = _Loading;
  const factory GetMemoriesState.error(String error) = _Error;
  const factory GetMemoriesState.success(List<MemoriesHiveModel> model) = _Success;
}
