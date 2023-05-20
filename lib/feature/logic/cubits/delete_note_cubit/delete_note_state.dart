part of 'delete_note_cubit.dart';

@freezed
class DeleteNoteState with _$DeleteNoteState {
  const factory DeleteNoteState.initial() = _Initial;
  const factory DeleteNoteState.loading() = _Loading;
  const factory DeleteNoteState.error(String error) = _Error;
  const factory DeleteNoteState.success() = _Success;

  const DeleteNoteState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
