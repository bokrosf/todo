import 'package:isar/isar.dart';
import 'package:todo/persistence/persistence.dart';
import 'package:todo/persistence/project.dart' as persistence;
import 'package:todo/feature/project_list/model/project.dart';

const int _defaultProjectId = 1;

class ProjectListModel {
  Future<void> ensureBuiltInProjects() async {
    final existing = await database.projects.get(_defaultProjectId);

    if (existing != null) {
      return;
    }

    await database.writeTxn(() async {
      final created = persistence.Project(
        name: 'Tasks',
        builtin: true,
      );

      created.id = _defaultProjectId;
      await database.projects.put(created);
    });
  }

  Future<List<Project>> load() async {
    final projects = await database.projects.where().findAll();

    return projects.map(
      (p) => Project(
        id: p.id,
        name: p.name,
        builtin: p.builtin,
      )
    ).toList();
  }

  Future<void> delete(int id) async {
    await database.projects.delete(id);
  }
}
