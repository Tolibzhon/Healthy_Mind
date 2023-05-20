import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthy_mind/feature/logic/models/note_hive_model.dart';
import 'package:healthy_mind/feature/logic/repositories/note_repo.dart';

part 'set_note_state.dart';
part 'set_note_cubit.freezed.dart';

class SetNoteCubit extends Cubit<SetNoteState> {
  SetNoteCubit(this.noteRepo,)
      : super(const SetNoteState.initial());

  final NoteRepo noteRepo;


  setNote(NoteHiveModel noteHiveModel) async {
    emit(const SetNoteState.loading());
    try {
      await noteRepo.setNote(noteHiveModel);
      emit(const SetNoteState.success());
    } catch (e) {
      emit(SetNoteState.error(e.toString()));
    }
  }

}
