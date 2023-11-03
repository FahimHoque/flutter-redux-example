import 'package:redux/redux.dart';
import 'package:todoapp/models/cart/cart.dart';
import 'package:todoapp/redux/actions/cart_action.dart';

final cartReducer = combineReducers<Cart>([
  TypedReducer<Cart, FetchCartSuccess>(_loadCartSucceeded),
  TypedReducer<Cart, AddItemToCartSuccess>(_addItemToCartSucceeded),
]);

Cart _loadCartSucceeded(Cart state, FetchCartSuccess action) {
  return action.cart;
}

Cart _addItemToCartSucceeded(Cart state, AddItemToCartSuccess action) {
  return state;
}
