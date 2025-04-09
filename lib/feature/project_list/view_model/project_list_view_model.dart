import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:todo/feature/project_list/model/project_list_model.dart';
import 'package:todo/feature/project_list/view_model/project_view_model.dart';
import 'package:todo/view_model/interaction_guard.dart';

class ProjectListViewModel extends ChangeNotifier with InteractionGuard {
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

  Future<void> load() async {
    if (!lock()) {
      return;
    }

    var loaded = await _model.load();
    _projects = loaded
      .map((p) => ProjectViewModel.fromModel(p))
      .toList();

    notifyListeners();
    unlock();
  }
}
