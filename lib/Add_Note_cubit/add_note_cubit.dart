import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note/main.dart';
import 'package:note/models/Note_Model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNoteBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      AddNoteFailuer(e.toString());
    }
  }
}
