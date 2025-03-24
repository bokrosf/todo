import 'package:flutter/material.dart';
import 'package:todo/task_list/view_model/task_view_model.dart';

class Task extends StatelessWidget {
  final TaskViewModel viewModel;

  const Task({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: viewModel.isCompleted,
          onChanged: (value) {
            print('Completion changed: $value');
          },
        ),
        Text(viewModel.text),
      ],);
  }
}
