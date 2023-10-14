import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/Screens/addTaskScreen.dart';
import 'package:flutter_application_1/data/task.dart';
import 'package:flutter_application_1/Widget/taskWidget.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  var taskbox = Hive.box<Task>('taskbox');

  bool isFabShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor,
      body: SafeArea(
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: taskbox.listenable(),
            builder: (context, value, child) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notif) {
                  setState(() {
                    if (notif.direction == ScrollDirection.forward) {
                      isFabShow = true;
                    }
                    if (notif.direction == ScrollDirection.reverse) {
                      isFabShow = false;
                    }
                  });
                  return true;
                },
                child: ListView.builder(
                  itemCount: taskbox.values.length,
                  itemBuilder: (BuildContext context, int index) {
                    var tasklist = taskbox.values.toList()[index];
                    return GetTaskItem(tasklist);
                  },
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: isFabShow,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                // ignore: prefer_const_constructors
                builder: (context) => AddTaskScreen(),
              ),
            );
          },
          backgroundColor: Greencolor,
          child: Image.asset('images/icon_add.png'),
        ),
      ),
    );
  }

  GetTaskItem(Task tasklist) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) => tasklist.delete(),
      child: TaskWidget(
        task: tasklist,
      ),
    );
  }
}
