import 'package:flutter_application_1/data/enumTask.dart';
import 'package:flutter_application_1/data/task_type.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
        image: 'images/banking.png',
        title: 'بانک',
        TaskItemEnum: TaskItemEnum.banking),
    TaskType(
        image: 'images/hard_working.png',
        title: 'کار زیاد',
        TaskItemEnum: TaskItemEnum.working),
    TaskType(
        image: 'images/meditate.png',
        title: 'مدیتیشن',
        TaskItemEnum: TaskItemEnum.meditate),
    TaskType(
        image: 'images/social_friends.png',
        title: 'قرار دوستان',
        TaskItemEnum: TaskItemEnum.friends),
    TaskType(
        image: 'images/work_meeting.png',
        title: 'قرار کاری',
        TaskItemEnum: TaskItemEnum.workmeet)
  ];
  return list;
}
