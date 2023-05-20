import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthy_mind/feature/logic/repositories/note_repo.dart';

part 'delete_note_state.dart';
part 'delete_note_cubit.freezed.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit(this.repo) : super(const DeleteNoteState.initial());

  final NoteRepo repo;

  delete(int id) async {
    emit(const DeleteNoteState.loading());
    try {
      await repo.deleteNote(id);
      emit(const DeleteNoteState.success());
    } catch (e) {
      emit(DeleteNoteState.error(e.toString()));
    }
  }
}
