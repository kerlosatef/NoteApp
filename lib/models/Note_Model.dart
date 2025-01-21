import 'package:hive/hive.dart';

part 'Note_Model.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subtitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  NoteModel({
    required this.date,
    required this.subtitle,
    required this.title,
    required this.color,
  });
}
