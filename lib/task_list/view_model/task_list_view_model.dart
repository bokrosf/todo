import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:todo/task_list/model/task.dart';
import 'package:todo/task_list/view_model/task_view_model.dart';

class TaskListViewModel extends ChangeNotifier {
  final List<TaskViewModel> _tasks = [];
  int _lastTaskId = 0;

  UnmodifiableListView<TaskViewModel> get tasks => UnmodifiableListView(_tasks);

  Future<void> add(String text) async {
    ++_lastTaskId;
    final task = Task(_lastTaskId, 'Welcome To Momoland: $_lastTaskId', false);
    _tasks.add(TaskViewModel(task));
  }

  Future<void> delete(int id) async {
    _tasks.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  Future<void> toggleCompletion(int id) async {
    _tasks.firstWhere((t) => t.id == id).toggleCompletion();
  }
}
