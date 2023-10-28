import 'package:hive/hive.dart';
import 'todo.dart';

class ToDoAdapter extends TypeAdapter<ToDo> {
  @override
  int get typeId => 1;

  @override
  ToDo read(BinaryReader reader) {
    final Map<dynamic, dynamic> fields = reader.readMap();
    return ToDo.fromJson(Map<String, dynamic>.from(fields));
  }

  @override
  void write(BinaryWriter writer, ToDo obj) {
    writer.writeMap(obj.toJson());
  }
}
