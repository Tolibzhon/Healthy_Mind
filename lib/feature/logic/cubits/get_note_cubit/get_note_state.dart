part of 'get_note_cubit.dart';

@freezed
class GetNoteState with _$GetNoteState {
  const factory GetNoteState.loading() = _Loading;
  const factory GetNoteState.error(String error) = _Error;
  const factory GetNoteState.success(List<NoteHiveModel> model) = _Success;
}
