// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/TaskScreen.dart';

import 'package:flutter_application_1/data/enumTask.dart';
import 'package:flutter_application_1/data/task.dart';
import 'package:flutter_application_1/data/task_type.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(TaskItemEnumAdapter());
  await Hive.openBox<Task>('taskbox');
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'SHM'),
        debugShowCheckedModeBanner: false,
        home: TaskScreen());
  }
}
