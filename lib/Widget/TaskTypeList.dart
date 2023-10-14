import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/data/task_type.dart';

class TaskTypeItemList extends StatelessWidget {
  TaskTypeItemList(
      {super.key,
      required this.tasktype,
      required this.selectedItems,
      required this.index});
  TaskType tasktype;

  int selectedItems;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color:
                  ((selectedItems == index) ? Greencolor : Colors.transparent)),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      margin: EdgeInsets.all(8),
      width: 140,
      child: Column(
          children: [Image.asset(tasktype.image!), Text(tasktype.title!)]),
    );
  }
}
