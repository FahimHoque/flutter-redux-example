import 'package:redux/redux.dart';
import 'package:todoapp/store/appstate.dart';
import '../actions/todo_action.dart';

final toDoReducer = combineReducers<ApplicationState>([
  TypedReducer<ApplicationState, FetchToDosRequested>(
    _loadToDosRequested,
  ),
  TypedReducer<ApplicationState, FetchTodosSucceeded>(
    _loadToDosSucceeded,
  ),
  TypedReducer<ApplicationState, FetchTodosFailed>(
    _loadToDosFailed,
  ),
  TypedReducer<ApplicationState, CreateToDoRequested>(
    _createToDo,
  ),
  TypedReducer<ApplicationState, ToggleToDoSucceededAction>(
    _toggleToDoSucceeded,
  ),
]);

ApplicationState _loadToDosRequested(
    ApplicationState state, FetchToDosRequested action) {
  return state.copyWith(isLoading: true);
}

ApplicationState _loadToDosSucceeded(
    ApplicationState state, FetchTodosSucceeded action) {
  return state.copyWith(todos: action.todos, isLoading: false);
}

ApplicationState _loadToDosFailed(
    ApplicationState state, FetchTodosFailed action) {
  ApplicationState newState = state.copyWith(isLoading: false);
  return newState;
}

ApplicationState _createToDo(
    ApplicationState state, CreateToDoRequested action) {
  return state.copyWith(todos: [...state.todos, action.todo], isLoading: true);
}

ApplicationState _toggleToDoSucceeded(
    ApplicationState state, ToggleToDoSucceededAction action) {
  final newToDos = state.todos.map((todo) {
    if (todo.uuid == action.todo.uuid) {
      return action.todo;
    }
    return todo;
  }).toList();
  return state.copyWith(todos: newToDos, isLoading: false);
}
