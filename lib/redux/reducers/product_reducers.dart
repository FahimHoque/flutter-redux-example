import 'package:redux/redux.dart';
import 'package:todoapp/redux/actions/product_action.dart';

import '../../models/product/product.dart';

final productReducer = combineReducers<List<Product>>([
  TypedReducer<List<Product>, FetchProductSuccess>(_loadProductsSucceeded),
]);

List<Product> _loadProductsSucceeded(
    List<Product> state, FetchProductSuccess action) {
  return action.products;
}
