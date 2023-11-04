import 'package:redux/redux.dart';
import 'package:todoapp/models/todo/todo.dart';
import '../actions/todo_action.dart';

final toDoReducer = combineReducers<List<ToDo>>([
  TypedReducer<List<ToDo>, FetchToDosRequested>(_loadToDosRequested),
  TypedReducer<List<ToDo>, FetchTodosSucceeded>(_loadToDosSucceeded),
  TypedReducer<List<ToDo>, FetchTodosFailed>(_loadToDosFailed),
  TypedReducer<List<ToDo>, CreateToDoRequested>(_createToDo),
  TypedReducer<List<ToDo>, ToggleToDoSucceeded>(_toggleToDoSucceeded)
]);

List<ToDo> _loadToDosRequested(List<ToDo> todos, FetchToDosRequested action) {
  return todos;
}

List<ToDo> _loadToDosSucceeded(List<ToDo> state, FetchTodosSucceeded action) {
  return action.todos;
}

List<ToDo> _loadToDosFailed(List<ToDo> todos, FetchTodosFailed action) {
  return todos;
}

List<ToDo> _createToDo(List<ToDo> todos, CreateToDoRequested action) {
  return todos..add(action.todo);
}

List<ToDo> _toggleToDoSucceeded(List<ToDo> todo, ToggleToDoSucceeded action) {
  return todo.map((todo) {
    if (todo.uuid == action.todo.uuid) {
      return action.todo;
    }
    return todo;
  }).toList();
}
