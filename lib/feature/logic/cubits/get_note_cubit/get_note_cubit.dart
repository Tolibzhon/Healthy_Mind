import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthy_mind/feature/logic/models/note_hive_model.dart';
import 'package:healthy_mind/feature/logic/repositories/note_repo.dart';

part 'get_note_state.dart';
part 'get_note_cubit.freezed.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit(this.repo) : super(const GetNoteState.loading());

  final NoteRepo repo;

  getNote() async {
    try {
      final noteList = await repo.getNote();
      emit(GetNoteState.success(noteList));
    } catch (e) {
      emit(GetNoteState.error(e.toString()));
    }
  }
}
