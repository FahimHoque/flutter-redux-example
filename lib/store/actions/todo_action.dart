// ignore_for_file: constant_identifier_names

import '../../models/todo/todo.dart';

enum ActionType {
  REQUESTED,
  LOADING,
  SUCCEEDED,
  FAILED,
}

abstract class ToDoAction {}

// class CreateToDoAction implements ToDoAction {
//   final ToDo todo;
//   CreateToDoAction(this.todo);
//   @override
//   String toString() => "$CreateToDoAction";
// }

// class CreateToDoSucceededAction implements ToDoAction {
//   @override
//   String toString() => "$CreateToDoSucceededAction";
// }

// class CreateToDoFailedAction implements ToDoAction {
//   final String error;

//   CreateToDoFailedAction(this.error);

//   @override
//   String toString() => "$CreateToDoFailedAction($error)";
// }

class CreateToDoRequested implements ToDoAction {
  final ToDo todo;

  CreateToDoRequested(this.todo);

  @override
  String toString() => "$CreateToDoRequested($todo)";
}

class CreateToDoSucceeded implements ToDoAction {
  @override
  String toString() => "$CreateToDoSucceeded()";
}

class CreateToDoFailed implements ToDoAction {
  final ToDo todo;
  final String error;

  CreateToDoFailed(this.todo, this.error);

  @override
  String toString() => "$CreateToDoFailed($todo, $error)";
}

class LoadToDosAction implements ToDoAction {
  @override
  String toString() => "$LoadToDosAction";
}

class LoadToDosSucceededAction implements ToDoAction {
  final List<ToDo> todos;

  LoadToDosSucceededAction(this.todos);

  @override
  String toString() => "$LoadToDosSucceededAction";
}

class LoadToDosFailedAction implements ToDoAction {
  final String error;

  LoadToDosFailedAction(this.error);

  @override
  String toString() => "$LoadToDosFailedAction($error)";
}

class ToggleToDoAction implements ToDoAction {
  final ToDo todo;

  ToggleToDoAction(this.todo);

  @override
  String toString() => "$ToggleToDoAction($todo)";
}

class ToggleToDoSucceededAction implements ToDoAction {
  final ToDo todo;

  ToggleToDoSucceededAction(this.todo);

  @override
  String toString() => "$ToggleToDoSucceededAction($todo)";
}

class ToggleToDoFailedAction implements ToDoAction {
  final ToDo todo;
  final String error;

  ToggleToDoFailedAction(this.todo, this.error);

  @override
  String toString() => "$ToggleToDoFailedAction($todo, $error)";
}
