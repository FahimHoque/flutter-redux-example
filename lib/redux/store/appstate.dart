import 'package:todoapp/models/cart/cart.dart';
import 'package:todoapp/models/product/product.dart';
import 'package:todoapp/models/todo/todo.dart';

class AppState {
  final List<ToDo> todos;
  final List<Product> products;
  final Cart cart;
  final bool isLoading;

  AppState(
    this.todos,
    this.products, {
    Cart? cart,
    this.isLoading = false,
  }) : cart = cart ?? Cart.empty();

  factory AppState.initial() {
    return AppState(
      const [],
      const [],
      cart: Cart.empty(),
      isLoading: false,
    );
  }

  AppState copyWith({
    List<ToDo>? todos,
    List<Product>? products,
    Cart? cart,
    bool? isLoading,
  }) {
    return AppState(
      todos ?? this.todos,
      products ?? this.products,
      cart: cart ?? this.cart,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
