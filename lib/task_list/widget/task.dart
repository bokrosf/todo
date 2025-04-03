import 'package:flutter/material.dart';
import 'package:todo/task_list/view_model/task_view_model.dart';

class Task extends StatelessWidget {
  final TaskViewModel _viewModel;
  final void Function(int) _onCompletionToggled;
  final Color? color;

  const Task({
    super.key,
    required TaskViewModel viewModel,
    required void Function(int) onCompletionToggled,
    this.color,
  })
    : _viewModel = viewModel,
      _onCompletionToggled = onCompletionToggled;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) {
        return Container(
          color: color,
          child: Row(
            children: [
              Checkbox(
                shape: CircleBorder(),
                value: _viewModel.isCompleted,
                onChanged: (_) => _onCompletionToggled.call(_viewModel.id),
              ),
              Expanded(
                child: Text(_viewModel.text),
              ),
            ],
          ),
        );
      },
    );
  }
}
