import 'package:redux/redux.dart';
import 'package:todoapp/models/cart/cart.dart';
import 'package:todoapp/redux/actions/cart_action.dart';

final cartReducer = combineReducers<Cart>([
  TypedReducer<Cart, FetchCartSuccess>(_loadCartSucceeded),
  TypedReducer<Cart, AddItemToCartSuccess>(_addItemToCartSucceeded),
  TypedReducer<Cart, RemoveItemFromCartSuccess>(_removeItemFromCartSucceeded),
]);

Cart _loadCartSucceeded(Cart state, FetchCartSuccess action) {
  return action.cart;
}

Cart _addItemToCartSucceeded(Cart state, AddItemToCartSuccess action) {
  return state;
}

Cart _removeItemFromCartSucceeded(
    Cart state, RemoveItemFromCartSuccess action) {
  return state;
}
