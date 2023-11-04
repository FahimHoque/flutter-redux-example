import 'package:todoapp/redux/reducers/cart_reducers.dart';
import 'package:todoapp/redux/reducers/product_reducers.dart';
import 'package:todoapp/store/appstate.dart';
import 'package:todoapp/redux/reducers/todo_reducers.dart';

ApplicationState appReducer(ApplicationState state, action) {
  return ApplicationState(
    toDoReducer(state, action).todos,
    productReducer(state.products, action),
    cart: cartReducer(state.cart, action),
  );
}
