import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;
  int listId;
  String text;
  int? parentId;
  DateTime createdAt;
  DateTime? plannedAt;
  DateTime? completedAt;
  String? note;

  Task({
    required this.listId,
    required this.text,
    this.parentId,
    required this.createdAt,
    this.note,
  });
}
