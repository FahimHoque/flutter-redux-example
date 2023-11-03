import 'package:redux/redux.dart';
import 'package:todoapp/redux/appstate.dart';
import 'package:redux_saga/redux_saga.dart';

import '../redux/reducer.dart';

Store<ApplicationState> configure() {
  SagaMiddleware sagaMiddleware = createSagaMiddleware();

  final store = Store<ApplicationState>(
    reducer,
    initialState: ApplicationState.initial(),
    middleware: [applyMiddleware(sagaMiddleware)],
  );

  sagaMiddleware.setStore(store);
  return store;
}
