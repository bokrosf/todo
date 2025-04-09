import 'package:todo/feature/project_list/model/project.dart';

class ProjectViewModel {
  final int id;
  String name;
  final bool builtin;

  ProjectViewModel({
    required this.id,
    required this.name,
    required this.builtin,
  });

  ProjectViewModel.fromModel(Project model)
    : this(
        id: model.id,
        name: model.name,
        builtin: model.builtin,
      );
}
