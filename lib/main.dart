import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todoapp/app.dart';
import 'package:todoapp/models/todo/todo_adapter.dart';

import 'redux/store/configure.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  Hive.registerAdapter(ToDoAdapter());
  runApp(MyApp(
    store: configureStore(),
  ));
}
