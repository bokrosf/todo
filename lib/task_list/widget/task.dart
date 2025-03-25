import 'package:flutter/material.dart';
import 'package:todo/task_list/view_model/task_view_model.dart';

class Task extends StatelessWidget {
  final TaskViewModel viewModel;
  final void Function(int) _onCompletionToggled;

  const Task({
    super.key,
    required this.viewModel,
    required void Function(int) onCompletionToggled
  })
    : _onCompletionToggled = onCompletionToggled;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (_, _) {
        return Card(
          color: Colors.white,
          margin: EdgeInsets.all(3),
          elevation: 2,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Checkbox(
              shape: CircleBorder(),
              value: viewModel.isCompleted,
              onChanged: (_) => _onCompletionToggled.call(viewModel.id),
            ),
            title: Text(viewModel.text),
            horizontalTitleGap: 5,
          ),
        );
      }
    );
  }
}
