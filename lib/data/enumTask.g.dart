// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enumTask.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskItemEnumAdapter extends TypeAdapter<TaskItemEnum> {
  @override
  final int typeId = 3;

  @override
  TaskItemEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskItemEnum.working;
      case 1:
        return TaskItemEnum.date;
      case 2:
        return TaskItemEnum.focus;
      case 3:
        return TaskItemEnum.banking;
      case 4:
        return TaskItemEnum.meditate;
      case 5:
        return TaskItemEnum.friends;
      case 6:
        return TaskItemEnum.workmeet;
      case 7:
        return TaskItemEnum.exercise;
      default:
        return TaskItemEnum.working;
    }
  }

  @override
  void write(BinaryWriter writer, TaskItemEnum obj) {
    switch (obj) {
      case TaskItemEnum.working:
        writer.writeByte(0);
        break;
      case TaskItemEnum.date:
        writer.writeByte(1);
        break;
      case TaskItemEnum.focus:
        writer.writeByte(2);
        break;
      case TaskItemEnum.banking:
        writer.writeByte(3);
        break;
      case TaskItemEnum.meditate:
        writer.writeByte(4);
        break;
      case TaskItemEnum.friends:
        writer.writeByte(5);
        break;
      case TaskItemEnum.workmeet:
        writer.writeByte(6);
        break;
      case TaskItemEnum.exercise:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskItemEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
