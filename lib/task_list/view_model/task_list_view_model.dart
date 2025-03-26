import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:todo/task_list/model/task.dart';
import 'package:todo/task_list/view_model/task_view_model.dart';

class TaskListViewModel extends ChangeNotifier {
  final List<TaskViewModel> _tasks = [
    TaskViewModel(Task(5, 'fifth', false)),
    TaskViewModel(Task(4, 'fourth', true)),
    TaskViewModel(Task(3, 'third', true)),
    TaskViewModel(Task(2, 'second', false)),
    TaskViewModel(Task(1, 'first', false)),
  ];

  int _lastTaskId = 6;

  UnmodifiableListView<TaskViewModel> get tasks => UnmodifiableListView(_tasks);

  Future<void> add(String text) async {
    if (text.isEmpty) {
      return;
    }

    final task = Task(_lastTaskId++, text, false);
    _tasks.insert(0, TaskViewModel(task));
    notifyListeners();
  }

  Future<void> delete(int id) async {
    _tasks.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  Future<void> toggleCompletion(int id) async {
    _tasks.firstWhere((t) => t.id == id).toggleCompletion();
  }

  Future<void> addToToday(int id) async {
    // TODO Implement marking the task's planned completion date.
  }
}
