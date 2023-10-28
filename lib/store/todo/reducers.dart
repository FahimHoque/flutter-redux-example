import 'dart:developer';

import 'package:redux/redux.dart';
import 'package:todoapp/models/todo/todo.dart';

import 'action.dart';

final toDoReducer = combineReducers<List<ToDo>>([
  TypedReducer<List<ToDo>, LoadToDosSucceededAction>(_loadToDosSucceeded),
  TypedReducer<List<ToDo>, CreateToDoAction>(_createToDo),
  TypedReducer<List<ToDo>, ToggleToDoSucceededAction>(_toggleToDoSucceeded),
]);

List<ToDo> _loadToDosSucceeded(
    List<ToDo> state, LoadToDosSucceededAction action) {
  return action.todos;
}

List<ToDo> _createToDo(List<ToDo> state, CreateToDoAction action) {
  log('CreateToDoAction Reducer');
  return [...state, action.todo];
}

List<ToDo> _toggleToDoSucceeded(
    List<ToDo> state, ToggleToDoSucceededAction action) {
  log("reducer called: ${action.todo.isCompleted}");
  return state
      .map((todo) => todo.uuid == action.todo.uuid ? action.todo : todo)
      .toList();
}
