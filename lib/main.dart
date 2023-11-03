import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:redux_saga/redux_saga.dart';
import 'package:todoapp/app.dart';
import 'package:todoapp/models/todo/todo_adapter.dart';
import 'package:todoapp/redux/appstate.dart';
import 'package:todoapp/sagas/todo_sagas.dart';

import 'redux/reducer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  Hive.registerAdapter(ToDoAdapter());
  var sagaMiddleware = createSagaMiddleware();
  final store = Store<ApplicationState>(
    reducer,
    initialState: ApplicationState.initial(),
    middleware: [applyMiddleware(sagaMiddleware)],
  );
  sagaMiddleware.setStore(store);
  sagaMiddleware.run(rootSaga);
  runApp(MyApp(
    store: store,
  ));
}
