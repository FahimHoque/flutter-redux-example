import 'dart:developer';

import 'package:redux/redux.dart';
import 'package:todoapp/api/todo_api.dart';
import 'package:todoapp/store/actions/todo_action.dart';

import '../../api/exception.dart';
import '../../models/todo/todo.dart';
import '../app_state.dart';

class ToDoMiddlware implements MiddlewareClass<ApplicationState> {
  @override
  call(Store<ApplicationState> store, action, NextDispatcher next) async {
    next(action);

    if (action is LoadToDosAction) {
      try {
        final todos = await ToDoApi.getToDos();
        store.dispatch(LoadToDosSucceededAction(todos));
      } on ApiException catch (e) {
        store.dispatch(LoadToDosFailedAction(e.message));
      }
    }

    if (action is CreateToDoRequested) {
      log('CreateToDoAction Middleware');
      try {
        await ToDoApi.createToDo(action.todo);
        store.dispatch(CreateToDoSucceeded());
      } on ApiException catch (e) {
        store.dispatch(CreateToDoFailed(action.todo, e.message));
      }
    }

    if (action is ToggleToDoAction) {
      try {
        log('ToggleToDoAction Middleware: ${action.todo}');
        ToDo todo = await ToDoApi.updateToDoStatus(action.todo.uuid);
        store.dispatch(ToggleToDoSucceededAction(todo));
      } on ApiException catch (e) {
        store.dispatch(ToggleToDoFailedAction(action.todo, e.message));
      }
    }
  }
}
