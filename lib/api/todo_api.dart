import 'package:hive/hive.dart';
import 'package:todoapp/models/todo/todo.dart';

const box_name = 'todo_box';

class ToDoApi {
  static Future<void> createToDo(ToDo todo) async {
    final box = await Hive.openBox<ToDo>(box_name);
    await box.add(todo);
  }

  static Future<List<ToDo>> getToDos() async {
    final box = await Hive.openBox<ToDo>(box_name);
    return box.values.toList();
  }

  static Future<ToDo> updateToDoStatus(String id) async {
    final box = await Hive.openBox<ToDo>(box_name);
    final todo = box.get(id);
    ToDo toReturn = todo!.copyWith(isCompleted: !todo.isCompleted);
    await box.put(id, todo);
    return toReturn;
  }

  static Future<void> deletToDo(String id) async {
    final box = await Hive.openBox<ToDo>(box_name);
    return await box.delete(id);
  }
}
