import 'package:isar/isar.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;
  int listId = 0;
  String text = '';
  int? parentId;
  DateTime createdAt = DateTime.now();
  DateTime? plannedAt;
  DateTime? completedAt;
  String? note;
}
