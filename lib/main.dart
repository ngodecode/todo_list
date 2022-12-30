import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/locator/db_locator.dart';
import 'package:todo_list/locator/task_locator.dart';
import 'package:todo_list/ui/page/task_list_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final locator = GetIt.instance;
  DBLocator.registerInto(locator);
  TaskLocator.registerInto(locator);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaskListPage(),
    );
  }

}

