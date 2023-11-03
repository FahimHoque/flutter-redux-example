import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:todoapp/sagas/cart_sagas.dart';
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
    middleware: [applyMiddleware(sagaMiddleware), LoggingMiddleware.printer()],
  );

  sagaMiddleware.setStore(store);
  sagaMiddleware.run(rootSaga);
  sagaMiddleware.run(ProductSagas().productRootSaga);
  sagaMiddleware.run(CartSaga().cartRootSaga);
  return store;
}
