import 'package:flutter/material.dart';
import 'package:todoapp/models/cart/cart.dart';
import 'package:todoapp/models/product/product.dart';
import 'package:todoapp/models/todo/todo.dart';

@immutable
class ApplicationState {
  final List<ToDo> todos;
  final List<Product> products;
  final Cart cart;

  ApplicationState(this.todos, this.products, {Cart? cart})
      : cart = cart ?? Cart.empty();

  factory ApplicationState.initial() {
    return ApplicationState(
      const [],
      const [],
      cart: Cart.empty(),
    );
  }

  ApplicationState copyWith({
    List<ToDo>? todos,
    List<Product>? products,
    Cart? cart,
  }) {
    return ApplicationState(
      todos ?? this.todos,
      products ?? this.products,
      cart: cart ?? this.cart,
    );
  }
}
