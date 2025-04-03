import 'package:isar/isar.dart';

part 'project.g.dart';

@collection
class Project {
  Id id = Isar.autoIncrement;
  String name;
  bool builtin;

  Project({
    required this.name,
    this.builtin = false,
  });
}
