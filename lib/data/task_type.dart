// ignore: unused_import
import 'package:hive/hive.dart';
part 'task_type.g.dart';

@HiveType(typeId: 2)
class TaskType {
  TaskType(
      {required this.image, required this.title, required this.TaskItemEnum});
  @HiveField(0)
  String image;
  @HiveField(1)
  String title;
  @HiveField(2)
  Enum TaskItemEnum;
}
