part of 'set_memories_cubit.dart';

@freezed
class SetMemoriesState with _$SetMemoriesState {
  const factory SetMemoriesState.initial() = _Initial;
  const factory SetMemoriesState.loading() = _Loading;
  const factory SetMemoriesState.error(String error) = _Error;
  const factory SetMemoriesState.success() = _Success;

  const SetMemoriesState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
