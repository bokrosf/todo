import 'dart:collection';

import 'package:todo/feature/project_list/model/project_list_model.dart';
import 'package:todo/feature/project_list/view_model/project_view_model.dart';

class ProjectListViewModel {
  final ProjectListModel _model;
  List<ProjectViewModel> _projects = [];

  ProjectListViewModel({
    required ProjectListModel model,
  })
    : _model = model;

  UnmodifiableListView get builtin {
    return UnmodifiableListView(_projects.where((p) => p.builtin));
  }

  UnmodifiableListView get custom {
    return UnmodifiableListView(_projects.where((p) => !p.builtin));
  }

}
