import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/persistence/project.dart';
import 'package:todo/persistence/task.dart';

late final Isar database;

Future<void> initialize() async {
  final appName = 'todo';
  var root = await getApplicationDocumentsDirectory();
  root = await Directory('${root.path}$appName').create(recursive: true);

  database = await Isar.open(
    [
      ProjectSchema,
      TaskSchema,
    ],
    name: 'database',
    directory: root.path,
  );
}
