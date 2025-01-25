import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note/main.dart';
import 'package:note/models/Note_Model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes() {
    try {
      var notesBox = Hive.box<NoteModel>(kNoteBox);
      List<NoteModel> notes = notesBox.values.toList();

      emit(NoteSuccess(notes));
    } on Exception catch (e) {
      emit(NoteFailuer(e.toString()));
    }
  }
}
