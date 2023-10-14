import 'package:hive/hive.dart';

part 'enumTask.g.dart';

@HiveType(typeId: 3)
enum TaskItemEnum {
  @HiveField(0)
  working,
  @HiveField(1)
  date,
  @HiveField(2)
  focus,
  @HiveField(3)
  banking,
  @HiveField(4)
  meditate,
  @HiveField(5)
  friends,
  @HiveField(6)
  workmeet,
  @HiveField(7)
  exercise
}
