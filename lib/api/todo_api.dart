// ignore_for_file: slash_for_doc_comments

import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:todoapp/models/todo/todo.dart';

const box_name = 'todo_box';

class ToDoApi {
  static Future<void> createToDo(ToDo todo) async {
    final box = await Hive.openBox<ToDo>(box_name);
    await box.put(todo.uuid, todo);
  }

  static Future<List<ToDo>> getToDos() async {
    final box = await Hive.openBox<ToDo>(box_name);
    for (var i = 0; i < box.length; i++) {
      log('ToDoApi: ${box.getAt(i)!.uuid}');
    }
    return box.values.toList();
  }

  static Future<ToDo> updateToDoStatus(String id) async {
    final box = await Hive.openBox<ToDo>(box_name);
    final todo = box.get(id);
    if (todo == null) throw Exception('ToDo not found');
    ToDo toReturn = todo.copyWith(isCompleted: !todo.isCompleted);
    await box.put(id, toReturn);
    return toReturn;
  }

  static Future<void> deleteToDo(String id) async {
    final box = await Hive.openBox<ToDo>(box_name);
    return await box.delete(id);
  }

  /**
   * Delete ALL ITEMS IN BOX
   */
  static Future<void> deleteAll() async {
    final box = await Hive.openBox<ToDo>(box_name);
    await box.clear();
  }
}
