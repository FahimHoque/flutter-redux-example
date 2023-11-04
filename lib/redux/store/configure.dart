import 'package:redux/redux.dart';
import 'package:todoapp/sagas/cart_sagas.dart';
import 'package:todoapp/sagas/product_sagas.dart';
import 'package:todoapp/redux/store/appstate.dart';
import 'package:redux_saga/redux_saga.dart';
import 'package:todoapp/sagas/todo_sagas.dart';

import '../reducer.dart';

Store<AppState> configureStore() {
  SagaMiddleware sagaMiddleware = createSagaMiddleware();

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [applyMiddleware(sagaMiddleware)],
  );

  sagaMiddleware.setStore(store);
  sagaMiddleware.run(ToDoSaga().todoRootSaga);
  sagaMiddleware.run(ProductSagas().productRootSaga);
  sagaMiddleware.run(CartSaga().cartRootSaga);
  return store;
}
