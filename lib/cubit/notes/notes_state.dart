part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NoteSuccess extends NotesState {
  final List<NoteModel> notes;

  NoteSuccess(this.notes);
}

class NoteLoading extends NotesState {}

class NoteFailuer extends NotesState {
  final String errMessage;
  NoteFailuer(this.errMessage);
}
