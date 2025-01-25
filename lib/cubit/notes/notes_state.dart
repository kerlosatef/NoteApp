part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NoteSuccess extends NotesState {}

class NoteLoading extends NotesState {
  final List<NoteModel> notes;

  NoteLoading(this.notes);
}

class NoteFailuer extends NotesState {
  final String errMessage;
  NoteFailuer(this.errMessage);
}
