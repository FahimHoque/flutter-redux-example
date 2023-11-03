import 'package:todoapp/models/todo/todo.dart';

class ApplicationState {
  final List<ToDo> todos;

  ApplicationState(this.todos);

  factory ApplicationState.initial() {
    return ApplicationState([]);
  }

  ApplicationState copyWith({List<ToDo>? todos}) {
    return ApplicationState(todos ?? this.todos);
  }
}
