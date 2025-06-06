import 'package:flutter/material.dart';
import 'package:todo/persistence/persistence.dart' as persistence;
import 'package:todo/task_list/widget/task_list_screen.dart';

Future<void> main() async {
  await persistence.initialize();
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


