import 'package:todo/persistence/persistence.dart';
import 'package:todo/persistence/project.dart';

const int _defaultProjectId = 1;

class ProjectListModel {
  Future<void> ensureBuiltInProjects() async {
    final existing = await database.projects.get(_defaultProjectId);

    if (existing != null) {
      return;
    }

    await database.writeTxn(() async {
      final created = Project(
        name: 'Tasks',
        builtin: true,
      );

      created.id = _defaultProjectId;
      await database.projects.put(created);
    });
  }
}
