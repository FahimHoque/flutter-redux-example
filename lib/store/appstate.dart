import 'package:flutter/material.dart';
import 'package:todoapp/models/cart/cart.dart';
import 'package:todoapp/models/product/product.dart';
import 'package:todoapp/models/todo/todo.dart';

@immutable
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
      isLoading: true,
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

  @override
  int get hashCode =>
      todos.hashCode ^ products.hashCode ^ cart.hashCode ^ isLoading.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplicationState &&
          runtimeType == other.runtimeType &&
          todos == other.todos &&
          products == other.products &&
          cart == other.cart &&
          isLoading == other.isLoading;
}
