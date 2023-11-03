import 'package:redux/redux.dart';
import 'package:todoapp/sagas/product_sagas.dart';
import 'package:todoapp/store/appstate.dart';
import 'package:redux_saga/redux_saga.dart';
import 'package:todoapp/sagas/todo_sagas.dart';

import '../redux/reducer.dart';

Store<ApplicationState> configureStore() {
  SagaMiddleware sagaMiddleware = createSagaMiddleware();

  final store = Store<ApplicationState>(
    reducer,
    initialState: ApplicationState.initial(),
    middleware: [applyMiddleware(sagaMiddleware)],
  );

  sagaMiddleware.setStore(store);
  sagaMiddleware.run(rootSaga);
  sagaMiddleware.run(ProductSagas().productRootSaga);
  return store;
}
