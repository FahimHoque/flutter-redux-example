import 'package:todoapp/store/app_state.dart';
import 'package:todoapp/store/todo/reducers.dart';

ApplicationState reducer(ApplicationState state, action) {
  return ApplicationState(
    toDoReducer(state.todos, action),
  );
}
