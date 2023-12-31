import 'package:redux_saga/redux_saga.dart';

import '../api/todo_api.dart';
import '../redux/actions/todo_action.dart';

class ToDoSaga {
  fetchToDos({dynamic action}) sync* {
    yield Try(
      () sync* {
        var result = Result();
        yield Call(() {
          return ToDoApi.getToDos();
        }, result: result);
        yield Put(FetchTodosSucceeded(result.value));
      },
      Catch: (e, s) sync* {
        yield Put(FetchTodosFailed(e.message));
      },
    );
  }

  createToDoAction({dynamic action}) sync* {
    yield Try(
      () sync* {
        var result = Result();
        yield Call(() {
          return ToDoApi.createToDo(
            action.todo,
          );
        }, result: result);
        yield Put(CreateToDoSucceeded(result.value));
      },
      Catch: (e, s) sync* {
        yield Put(CreateToDoFailed(action.todo, e.toString()));
      },
    );
  }

  toggleToDoAction({dynamic action}) sync* {
    yield Try(
      () sync* {
        var result = Result();
        yield Call(() {
          return ToDoApi.updateToDoStatus(
            action.todo.uuid,
          );
        }, result: result);
        yield Put(ToggleToDoSucceeded(result.value));
      },
      Catch: (e, s) sync* {
        yield Put(ToggleToDoFailed(action.todo, e.message));
      },
    );
  }

  todoRootSaga() sync* {
    yield TakeEvery(fetchToDos, pattern: FetchToDosRequested);
    yield TakeEvery(createToDoAction, pattern: CreateToDoRequested);
    yield TakeEvery(toggleToDoAction, pattern: ToggleToDoRequested);
  }
}
