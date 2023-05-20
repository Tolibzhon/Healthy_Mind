part of 'delete_memories_cubit.dart';

@freezed
class DeleteMemoriesState with _$DeleteMemoriesState {
  const factory DeleteMemoriesState.initial() = _Initial;
  const factory DeleteMemoriesState.loading() = _Loading;
  const factory DeleteMemoriesState.error(String error) = _Error;
  const factory DeleteMemoriesState.success() = _Success;

  const DeleteMemoriesState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
