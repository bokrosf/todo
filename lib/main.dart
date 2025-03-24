import 'package:flutter/material.dart';
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
        appBar: AppBar(
          title: Text('Todo')
        ),
        body: Center(
          child: TaskListScreen(),
        ),
      ),
    );
  }
}


