import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/task_list/view_model/task_list_view_model.dart';
import 'package:todo/task_list/widget/task_list_screen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 185, 202, 233),
        appBar: AppBar(
          title: Text('Todo')
        ),
        body: TaskListScreen(),
      ),
    );
  }
}


