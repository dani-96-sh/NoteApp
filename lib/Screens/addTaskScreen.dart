import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/TaskTypeList.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/data/task.dart';
import 'package:flutter_application_1/data/task_type.dart';
import 'package:flutter_application_1/Utility/utility.dart';
import 'package:hive/hive.dart';
import 'package:time_pickerr/time_pickerr.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var taskbox = Hive.box<Task>('taskbox');
  FocusNode listenerOne = FocusNode();
  FocusNode listenerTwo = FocusNode();

  // ignore: non_constant_identifier_names
  final TextEditingController ControllerTextTitle = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController ControllerTextSubTitle = TextEditingController();

  DateTime? _time;

  int selectedItems = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenerOne.addListener(() {
      setState(() {});
    });
    listenerTwo.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    controller: ControllerTextTitle,
                    focusNode: listenerOne,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      labelText: 'عنوان تسک',
                      labelStyle: TextStyle(
                          color: listenerOne.hasFocus
                              ? Greencolor
                              : GreyTextColor),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Greencolor),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: GreyTextColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    controller: ControllerTextSubTitle,
                    focusNode: listenerTwo,
                    maxLines: 2,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      labelText: 'عنوان تسک',
                      labelStyle: TextStyle(
                          color: listenerTwo.hasFocus
                              ? Greencolor
                              : GreyTextColor),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Greencolor),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: GreyTextColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CustomHourPicker(
                    title: 'زمان مد نظرت رو انتخاب کن',
                    negativeButtonText: 'حذف ',
                    negativeButtonStyle: TextStyle(color: Colors.red),
                    positiveButtonText: 'انتخاب ',
                    onNegativePressed: (
                      context,
                    ) {},
                    onPositivePressed: ((context, time) {
                      _time = time;
                    }),
                  ),
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: getTaskTypeList().length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedItems = index;
                        });
                      },
                      child: TaskTypeItemList(
                          tasktype: getTaskTypeList()[index],
                          selectedItems: selectedItems,
                          index: index),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String taskTitle = ControllerTextTitle.text;
                  String taskSubTitle = ControllerTextSubTitle.text;
                  addtask(taskTitle, taskSubTitle);
                  Navigator.pop(context);
                },
                child: Text('اضافه کردن تسک'),
                style: ElevatedButton.styleFrom(backgroundColor: Greencolor),
              ),
              SizedBox(
                height: 73,
              )
            ],
          ),
        ),
      ),
    );
  }

  addtask(String taskTitle, String taskSubTitle) {
    var task = Task(
        title: taskTitle,
        subTitle: taskSubTitle,
        time: _time!,
        taskType: getTaskTypeList()[selectedItems]);
    taskbox.add(task);
  }
}
