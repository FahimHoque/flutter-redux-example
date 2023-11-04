import '../../models/todo/todo.dart';

class CreateToDoRequested {
  final ToDo todo;

  CreateToDoRequested(this.todo);
}

class CreateToDoSucceeded {
  final ToDo todo;

  CreateToDoSucceeded(this.todo);
}

class CreateToDoFailed {
  final ToDo todo;
  final String error;

  CreateToDoFailed(this.todo, this.error);
}

// FETCH TODOs

class FetchToDosRequested {}

class FetchTodosSucceeded {
  final List<ToDo> todos;

  FetchTodosSucceeded(this.todos);
}

class FetchTodosFailed {
  final String error;
  FetchTodosFailed(this.error);
}

// TOGGLE TODOs

class ToggleToDoAction {
  final ToDo todo;

  ToggleToDoAction(this.todo);
}

class ToggleToDoSucceededAction {
  final ToDo todo;

  ToggleToDoSucceededAction(this.todo);
}

class ToggleToDoFailedAction {
  final ToDo todo;
  final String error;

  ToggleToDoFailedAction(this.todo, this.error);
}
