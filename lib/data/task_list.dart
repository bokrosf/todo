import 'package:isar/isar.dart';

part 'task_list.g.dart';

@collection
class TaskList {
  Id id = Isar.autoIncrement;
  String name = '';
}
