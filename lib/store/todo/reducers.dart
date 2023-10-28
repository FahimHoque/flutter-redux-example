import 'package:redux/redux.dart';
import 'package:todoapp/models/todo/todo.dart';

import 'action.dart';

final toDoReducer = combineReducers<List<ToDo>>([
  TypedReducer<List<ToDo>, LoadToDosSucceededAction>(_loadToDosSucceeded),
  TypedReducer<List<ToDo>, CreateToDoAction>(_createToDo),
]);

List<ToDo> _loadToDosSucceeded(
    List<ToDo> state, LoadToDosSucceededAction action) {
  return action.todos;
}

List<ToDo> _createToDo(List<ToDo> state, CreateToDoAction action) {
  print('CreateToDoAction Reducer');
  return [...state, action.todo];
}
