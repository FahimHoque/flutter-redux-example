// ignore_for_file: constant_identifier_names

import '../../models/todo/todo.dart';

enum ActionType {
  REQUESTED,
  LOADING,
  SUCCEEDED,
  FAILED,
}

abstract class ToDoAction {
  @override
  String toString() => runtimeType.toString();
}

// CREATE TODOs

class CreateToDoRequested implements ToDoAction {
  final ToDo todo;

  CreateToDoRequested(this.todo);
}

class CreateToDoSucceeded implements ToDoAction {
  final ToDo todo;

  CreateToDoSucceeded(this.todo);
}

class CreateToDoFailed implements ToDoAction {
  final ToDo todo;
  final String error;

  CreateToDoFailed(this.todo, this.error);
}

// FETCH TODOs

class FetchToDosRequested implements ToDoAction {}

class FetchTodosSucceeded implements ToDoAction {
  final List<ToDo> todos;

  FetchTodosSucceeded(this.todos);
}

class FetchTodosFailed implements ToDoAction {
  final String error;
  FetchTodosFailed(this.error);
}

// TOGGLE TODOs

class ToggleToDoAction implements ToDoAction {
  final ToDo todo;

  ToggleToDoAction(this.todo);
}

class ToggleToDoSucceededAction implements ToDoAction {
  final ToDo todo;

  ToggleToDoSucceededAction(this.todo);
}

class ToggleToDoFailedAction implements ToDoAction {
  final ToDo todo;
  final String error;

  ToggleToDoFailedAction(this.todo, this.error);
}
