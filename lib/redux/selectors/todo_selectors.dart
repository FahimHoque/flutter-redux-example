import 'package:reselect/reselect.dart';

import '../../models/todo/todo.dart';
import '../store/appstate.dart';

List<ToDo> getTodos(AppState state) {
  return state.todos;
}

final getCompletedTodos = createSelector1(
  getTodos,
  (List<ToDo> todos) => todos.where((todo) => todo.isCompleted).toList(),
);
