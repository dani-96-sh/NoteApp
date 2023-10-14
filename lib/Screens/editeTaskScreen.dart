import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/addTaskScreen.dart';
import 'package:flutter_application_1/Widget/TaskTypeList.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/data/task.dart';
import 'package:flutter_application_1/Utility/utility.dart';
import 'package:hive/hive.dart';
import 'package:time_pickerr/time_pickerr.dart';

class EditeTaskScreen extends StatefulWidget {
  EditeTaskScreen({super.key, required this.task});
  Task task;

  @override
  State<EditeTaskScreen> createState() => _EditeTaskScreenState();
}

class _EditeTaskScreenState extends State<EditeTaskScreen> {
  var taskbox = Hive.box<Task>('taskbox');
  FocusNode listenerOne = FocusNode();
  FocusNode listenerTwo = FocusNode();

  // ignore: non_constant_identifier_names
  TextEditingController? ControllerTextTitle;
  // ignore: non_constant_identifier_names
  TextEditingController? ControllerTextSubTitle;

  DateTime? _time;

  int selectedItems = 0;
  @override
  void initState() {
    super.initState();

    ControllerTextTitle = TextEditingController(text: widget.task.title);
    ControllerTextSubTitle = TextEditingController(text: widget.task.subTitle);

    listenerOne.addListener(() {
      setState(() {});
    });
    var index = getTaskTypeList().indexWhere((element) {
      return element!.TaskItemEnum == widget.task.taskType!.TaskItemEnum;
    });
    selectedItems = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                        color:
                            listenerOne.hasFocus ? Greencolor : GreyTextColor),
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
                        color:
                            listenerTwo.hasFocus ? Greencolor : GreyTextColor),
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
                String taskTitle = ControllerTextTitle!.text;
                String taskSubTitle = ControllerTextSubTitle!.text;
                EditeTask(taskTitle, taskSubTitle, _time!);
                Navigator.pop(context);
              },
              child: Text('ویرایش کردن تسک'),
              style: ElevatedButton.styleFrom(backgroundColor: Greencolor),
            )
          ],
        ),
      ),
    );
  }

  EditeTask(String taskTitle, String taskSubTitle, DateTime time) {
    widget.task.title = taskTitle;
    widget.task.subTitle = taskSubTitle;
    widget.task.time = _time!;
    widget.task.taskType = getTaskTypeList()[selectedItems];
    widget.task.save();
  }
}
