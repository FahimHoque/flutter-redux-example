import '../../models/todo/todo.dart';

class CreateToDoRequested {
  final ToDo todo;

  CreateToDoRequested(this.todo);

  @override
  String toString() => 'CreateToDoRequested { todo: $todo }';
}

class CreateToDoSucceeded {
  final ToDo todo;

  CreateToDoSucceeded(this.todo);

  @override
  String toString() => 'CreateToDoSucceeded { todo: $todo }';
}

class CreateToDoFailed {
  final ToDo todo;
  final String error;

  CreateToDoFailed(this.todo, this.error);

  @override
  String toString() => 'CreateToDoFailed { todo: $todo, error: $error }';
}

// FETCH TODOs

class FetchToDosRequested {
  FetchToDosRequested();

  @override
  String toString() => 'FetchToDosRequested';
}

class FetchTodosSucceeded {
  final List<ToDo> todos;

  FetchTodosSucceeded(this.todos);

  @override
  String toString() => 'FetchTodosSucceeded { todos: $todos }';
}

class FetchTodosFailed {
  final String error;
  FetchTodosFailed(this.error);

  @override
  String toString() => 'FetchTodosFailed { error: $error }';
}

// TOGGLE TODOs

class ToggleToDoRequested {
  final ToDo todo;

  ToggleToDoRequested(this.todo);

  @override
  String toString() => 'ToggleToDoRequested { todo: $todo }';
}

class ToggleToDoSucceeded {
  final ToDo todo;

  ToggleToDoSucceeded(this.todo);

  @override
  String toString() => 'ToggleToDoSucceeded { todo: $todo }';
}

class ToggleToDoFailed {
  final ToDo todo;
  final String error;

  ToggleToDoFailed(this.todo, this.error);

  @override
  String toString() => 'ToggleToDoFailed { todo: $todo, error: $error }';
}
