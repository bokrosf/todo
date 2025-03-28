import 'package:isar/isar.dart';

@collection
class TaskList {
  Id id = Isar.autoIncrement;
  String name = '';
}
