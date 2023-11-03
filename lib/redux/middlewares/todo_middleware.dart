import 'package:redux/redux.dart';
import 'package:todoapp/api/todo_api.dart';
import 'package:todoapp/redux/actions/todo_action.dart';

import '../../api/exception.dart';
import '../../models/todo/todo.dart';
import '../appstate.dart';

class ToDoMiddlware implements MiddlewareClass<ApplicationState> {
  @override
  call(Store<ApplicationState> store, action, NextDispatcher next) async {
    next(action);

    if (action is FetchToDosRequested) {
      try {
        final todos = await ToDoApi.getToDos();
        store.dispatch(FetchTodosSucceeded(todos));
      } on ApiException catch (e) {
        store.dispatch(FetchTodosFailed(e.message));
      }
    }

    if (action is CreateToDoRequested) {
      try {
        await ToDoApi.createToDo(action.todo);
        store.dispatch(CreateToDoSucceeded(action.todo));
      } on ApiException catch (e) {
        store.dispatch(CreateToDoFailed(action.todo, e.message));
      }
    }

    if (action is ToggleToDoAction) {
      try {
        ToDo todo = await ToDoApi.updateToDoStatus(action.todo.uuid);
        store.dispatch(ToggleToDoSucceededAction(todo));
      } on ApiException catch (e) {
        store.dispatch(ToggleToDoFailedAction(action.todo, e.message));
      }
    }
  }
}
