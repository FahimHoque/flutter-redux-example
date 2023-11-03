import 'package:todoapp/store/appstate.dart';
import 'package:todoapp/redux/reducers/todo_reducers.dart';

ApplicationState reducer(ApplicationState state, action) {
  return ApplicationState(toDoReducer(state.todos, action));
}
