import 'package:todoapp/redux/actions/action_utility.dart';
import 'package:todoapp/redux/reducers/cart_reducers.dart';
import 'package:todoapp/redux/reducers/product_reducers.dart';
import 'package:todoapp/redux/store/appstate.dart';
import 'package:todoapp/redux/reducers/todo_reducers.dart';

AppState appReducer(AppState state, action) {
  String type = ActionUtility.getBuildType(action.runtimeType.toString());
  return AppState(
    toDoReducer(state, action).todos,
    productReducer(state.products, action),
    cart: cartReducer(state.cart, action),
    isLoading: type == 'REQUESTED' ? true : false,
  );
}

AppState appReducer2(AppState state, dynamic action) {
  String type = ActionUtility.getBuildType(action.runtimeType.toString());
  if (type == 'REQUESTED') {
    return AppState(
      state.todos,
      state.products,
      cart: state.cart,
      isLoading: true,
    );
  } else if (type == 'SUCCESS') {
    return AppState(
      toDoReducer(state, action).todos,
      productReducer(state.products, action),
      cart: cartReducer(state.cart, action),
      isLoading: false,
    );
  } else {
    return AppState(
      state.todos,
      state.products,
      cart: state.cart,
      isLoading: false,
    );
  }
}
