import '../../models/todo/todo.dart';

abstract class ToDoAction {}

class CreateToDoAction implements ToDoAction {
  final ToDo todo;
  CreateToDoAction(this.todo);
  @override
  String toString() => "$CreateToDoAction";
}

class CreateToDoSucceededAction implements ToDoAction {
  @override
  String toString() => "$CreateToDoSucceededAction";
}

class CreateToDoFailedAction implements ToDoAction {
  final String error;

  CreateToDoFailedAction(this.error);

  @override
  String toString() => "$CreateToDoFailedAction($error)";
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
