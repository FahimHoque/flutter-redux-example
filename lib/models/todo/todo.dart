import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'todo.freezed.dart';
part 'todo.g.dart';

enum TourStatusEnum { active, completed, planned }

@HiveType(typeId: 2)
@freezed
class ToDo extends HiveObject with _$ToDo {
  @HiveType(typeId: 3)
  factory ToDo({
    @HiveField(0) @Default("") String uuid,
    @HiveField(1) @Default("") String name,
    @HiveField(2) @Default("") String description,
    @HiveField(3) @Default(false) bool isCompleted,
  }) = _ToDo;

  factory ToDo.fromJson(Map<String, dynamic> json) => _$ToDoFromJson(json);

  ToDo._();
}
