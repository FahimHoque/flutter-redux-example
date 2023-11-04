import 'package:todoapp/models/cart/cart.dart';
import 'package:todoapp/models/product/product.dart';
import 'package:todoapp/models/todo/todo.dart';

class ApplicationState {
  final List<ToDo> todos;
  final List<Product> products;
  final Cart cart;
  final bool isLoading;

  ApplicationState(
    this.todos,
    this.products, {
    Cart? cart,
    this.isLoading = false,
  }) : cart = cart ?? Cart.empty();

  factory ApplicationState.initial() {
    return ApplicationState(
      const [],
      const [],
      cart: Cart.empty(),
      isLoading: false,
    );
  }

  ApplicationState copyWith({
    List<ToDo>? todos,
    List<Product>? products,
    Cart? cart,
    bool? isLoading,
  }) {
    return ApplicationState(
      todos ?? this.todos,
      products ?? this.products,
      cart: cart ?? this.cart,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
