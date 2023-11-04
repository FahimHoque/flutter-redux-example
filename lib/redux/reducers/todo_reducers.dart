import 'package:redux/redux.dart';
import 'package:todoapp/redux/store/appstate.dart';
import '../actions/todo_action.dart';

final toDoReducer = combineReducers<AppState>([
  TypedReducer<AppState, FetchToDosRequested>(_loadToDosRequested),
  TypedReducer<AppState, FetchTodosSucceeded>(_loadToDosSucceeded),
  TypedReducer<AppState, FetchTodosFailed>(_loadToDosFailed),
  TypedReducer<AppState, CreateToDoRequested>(_createToDo),
  TypedReducer<AppState, ToggleToDoSucceeded>(_toggleToDoSucceeded)
]);

AppState _loadToDosRequested(AppState state, FetchToDosRequested action) {
  AppState newState = state.copyWith(isLoading: true);
  return newState;
}

AppState _loadToDosSucceeded(AppState state, FetchTodosSucceeded action) {
  AppState newState = state.copyWith(
    todos: action.todos,
    isLoading: false,
  );
  return newState;
}

AppState _loadToDosFailed(AppState state, FetchTodosFailed action) {
  AppState newState = state.copyWith(isLoading: false);
  return newState;
}

AppState _createToDo(AppState state, CreateToDoRequested action) {
  return state.copyWith(todos: [...state.todos, action.todo], isLoading: true);
}

AppState _toggleToDoSucceeded(AppState state, ToggleToDoSucceeded action) {
  final newToDos = state.todos.map((todo) {
    if (todo.uuid == action.todo.uuid) {
      return action.todo;
    }
    return todo;
  }).toList();
  return state.copyWith(todos: newToDos, isLoading: false);
}
