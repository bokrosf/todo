import 'package:isar/isar.dart';

part 'task_list.g.dart';

@collection
class TaskList {
  Id id = Isar.autoIncrement;
  String name;
  bool builtin;

  TaskList({
    required this.name,
    this.builtin = false,
  });
}
