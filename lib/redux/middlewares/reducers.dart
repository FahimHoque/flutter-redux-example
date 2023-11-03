import 'package:redux/redux.dart';
import 'package:todoapp/models/todo/todo.dart';
import '../actions/todo_action.dart';

final toDoReducer = combineReducers<List<ToDo>>([
  TypedReducer<List<ToDo>, FetchTodosSucceeded>(_loadToDosSucceeded),
  TypedReducer<List<ToDo>, CreateToDoRequested>(_createToDo),
  TypedReducer<List<ToDo>, ToggleToDoSucceededAction>(_toggleToDoSucceeded),
]);

List<ToDo> _loadToDosSucceeded(List<ToDo> state, FetchTodosSucceeded action) {
  return action.todos;
}

List<ToDo> _createToDo(List<ToDo> state, CreateToDoRequested action) {
  return [...state, action.todo];
}

List<ToDo> _toggleToDoSucceeded(
    List<ToDo> state, ToggleToDoSucceededAction action) {
  return state
      .map((todo) => todo.uuid == action.todo.uuid ? action.todo : todo)
      .toList();
}
