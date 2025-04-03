import 'package:flutter/widgets.dart';
import 'package:todo/feature/task_list/model/task.dart';

class TaskViewModel extends ChangeNotifier {
  bool _isCompleted;
  final int id;
  final String text;

  TaskViewModel(Task task)
    : id = task.id,
      text = task.text,
      _isCompleted = task.isCompleted;

  bool get isCompleted => _isCompleted;

  void toggleCompletion() {
    _isCompleted = !_isCompleted;
    notifyListeners();
  }
}
