import 'dart:developer';

import 'package:redux/redux.dart';
import 'package:todoapp/api/todo_api.dart';
import 'package:todoapp/store/todo/action.dart';

import '../../api/exception.dart';
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

    if (action is CreateToDoAction) {
      log('CreateToDoAction Middleware');
      try {
        await ToDoApi.createToDo(action.todo);
        store.dispatch(CreateToDoSucceededAction());
      } on ApiException catch (e) {
        store.dispatch(CreateToDoFailedAction(e.message));
      }
    }
  }
}
