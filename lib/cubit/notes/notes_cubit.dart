import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note/models/Note_Model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
}
