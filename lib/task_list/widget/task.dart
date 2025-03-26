import 'package:flutter/material.dart';
import 'package:todo/task_list/view_model/task_view_model.dart';

class Task extends StatelessWidget {
  final TaskViewModel viewModel;
  final void Function(int) _onCompletionToggled;
  final Color? color;

  const Task({
    super.key,
    required this.viewModel,
    required void Function(int) onCompletionToggled,
    this.color,
  })
    : _onCompletionToggled = onCompletionToggled;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (_, _) {
        return Container(
          color: color,
          child: Row(
            children: [
              Checkbox(
                shape: CircleBorder(),
                value: viewModel.isCompleted,
                onChanged: (_) => _onCompletionToggled.call(viewModel.id),
              ),
              Text(viewModel.text),
            ],
          ),
        );
      }
    );
  }
}
