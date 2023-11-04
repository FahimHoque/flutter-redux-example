import 'package:redux/redux.dart';
import 'package:todoapp/redux/actions/product_action.dart';

import '../../models/product/product.dart';

final productReducer = combineReducers<List<Product>>([
  TypedReducer<List<Product>, GetProductsSuccess>(loadProductsSuccees),
]);

List<Product> loadProductsSuccees(
    List<Product> state, GetProductsSuccess action) {
  return action.products;
}
