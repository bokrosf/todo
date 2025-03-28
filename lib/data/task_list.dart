import 'package:isar/isar.dart';

part 'task_list.g.dart';

@collection
class TaskList {
  Id id = Isar.autoIncrement;
  String name;
  bool custom;

  TaskList({
    required this.name,
    this.custom = true,
  });
}
