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
        return Row(
          children: [
            Checkbox(
              value: viewModel.isCompleted,
              onChanged: (value) => _onCompletionToggled.call(viewModel.id),
            ),
            Text(viewModel.text),
          ],
        );
      }
    );
  }
}
