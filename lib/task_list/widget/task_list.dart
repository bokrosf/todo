import 'package:flutter/material.dart';
import 'package:todo/task_list/view_model/task_list_view_model.dart';
import 'package:todo/task_list/widget/task.dart';

class TaskList extends StatelessWidget {
  final TaskListViewModel _viewModel;

  const TaskList({
    super.key,
    required TaskListViewModel viewModel,
  })
    : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (_, _) {
        return ListView.builder(
          itemCount: _viewModel.tasks.length,
          itemBuilder: (_, index) {
            final task = _viewModel.tasks[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Dismissible(
                  key: ValueKey(task.id),
                  background: Material(
                    color: Colors.amber,
                    child: Text('Not Implemented.'),
                  ),
                  secondaryBackground: Material(color: Colors.red),
                  confirmDismiss: (direction) => _dismissTask(task.id, direction),
                  child: Task(
                    viewModel: task,
                    color: Colors.white,
                    onCompletionToggled: _toggleCompletion,
                  ),
                ),
              ),
            );
          }
      );
      },
    );
  }

  void _toggleCompletion(int id) async {
    await _viewModel.toggleCompletion(id);
  }

  Future<bool> _dismissTask(int id, DismissDirection direction) async {
    if (direction == DismissDirection.endToStart) {
      await _viewModel.delete(id);
      return true;
    }

    if (direction == DismissDirection.startToEnd) {
      await _viewModel.addToToday(id);
      return false;
    }

    return false;
  }
}
