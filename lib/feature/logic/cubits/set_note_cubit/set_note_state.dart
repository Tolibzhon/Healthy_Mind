part of 'set_note_cubit.dart';

@freezed
class SetNoteState with _$SetNoteState {
  const factory SetNoteState.initial() = _Initial;
  const factory SetNoteState.loading() = _Loading;
  const factory SetNoteState.error(String error) = _Error;
  const factory SetNoteState.success() = _Success;

  const SetNoteState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
      
}
