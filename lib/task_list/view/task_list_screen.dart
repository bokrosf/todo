import 'package:flutter/material.dart';
import 'package:todo/task_list/view_model/task_list_view_model.dart';
import 'package:todo/task_list/view/task_list.dart';

class TaskListScreen extends StatefulWidget {
  final TaskListViewModel _viewModel;

  const TaskListScreen({
    super.key,
    required TaskListViewModel viewModel,
  })
    : _viewModel = viewModel;

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final _newTaskController = TextEditingController();
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _newTaskController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget._viewModel,
      builder:(_, _) {
        return Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            children: [
              Text('Header'),
              Expanded(
                child: TaskList(
                  viewModel: widget._viewModel,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 20.0,
                  top: 8.0,
                ),
                child: TextField(
                  controller: _newTaskController,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Add task',
                  ),
                  onSubmitted: _addTask,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addTask(String text) async {
    await widget._viewModel.add(text.trim());
    _newTaskController.clear();
    _focusNode.requestFocus();
  }
}
