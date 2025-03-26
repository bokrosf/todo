import 'package:flutter/material.dart';
import 'package:todo/task_list/view_model/task_list_view_model.dart';
import 'package:todo/task_list/widget/task.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final _viewModel = TaskListViewModel();
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
      listenable: _viewModel,
      builder: (_, _) {
        return Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            children: [
              Text('Header'),
              Expanded(
                child: ListView.builder(
                  itemCount: _viewModel.tasks.length,
                  itemBuilder: (context, index) {
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
                          onDismissed: (direction) => _dismissTask(task.id, direction),
                          confirmDismiss: (direction) => _dismissTask(task.id, direction),
                          child: Task(
                            viewModel: task,
                            color: Colors.white,
                            onCompletionToggled: toggleCompletion,
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0, top: 8.0),
                child: TextField(
                  controller: _newTaskController,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Add task',
                  ),
                  onSubmitted: addTask,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void toggleCompletion(int id) async {
    await _viewModel.toggleCompletion(id);
  }

  void addTask(String text) async {
    await _viewModel.add(text);
    _newTaskController.clear();
    _focusNode.requestFocus();
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
