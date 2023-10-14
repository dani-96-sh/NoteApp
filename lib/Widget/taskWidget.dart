import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/editeTaskScreen.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/data/task.dart';

import 'package:msh_checkbox/msh_checkbox.dart';

// ignore: must_be_immutable
class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});
  Task task;
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isBoxChecked = false;

  @override
  void initState() {
    super.initState();
    isBoxChecked = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return getTaskItem();
  }

  Widget getTaskItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBoxChecked = !isBoxChecked;
          widget.task.isDone = isBoxChecked;
          widget.task.save();
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Container(
          height: 132,
          width: 380,
          decoration: BoxDecoration(
            color: WhiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: getMainContent(),
          ),
        ),
      ),
    );
  }

  Row getMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Row(
              children: [
                MSHCheckbox(
                  size: 32,
                  value: isBoxChecked,
                  colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                    checkedColor: Greencolor,
                  ),
                  style: MSHCheckboxStyle.stroke,
                  onChanged: (selected) {},
                ),
                Spacer(),
                Text(
                  widget.task.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              widget.task.subTitle,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: GreyTextColor),
            ),
            Spacer(),
            getTimeAndBadge()
          ]),
        ),
        Image.asset(widget.task.taskType!.image)
      ],
    );
  }

  Row getTimeAndBadge() {
    return Row(
      children: [
        Container(
          height: 28,
          width: 92,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14), color: Greencolor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                Text(
                  "${widget.task.time.hour}:${getMinuteUnderten(widget.task.time)}",
                  style: TextStyle(color: WhiteColor, fontFamily: 'SHM'),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset('images/icon_time.png')
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditeTaskScreen(
                      task: widget.task,
                    )));
          },
          child: Container(
            height: 28,
            width: 92,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Greenlightcolor),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
              child: Row(
                children: [
                  Text(
                    'ویرایش',
                    style: TextStyle(
                      color: Greencolor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset('images/icon_edit.png')
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  String getMinuteUnderten(DateTime time) {
    if (time.minute < 10) {
      return '0${time.minute}';
    } else {
      return time.minute.toString();
    }
  }
}
