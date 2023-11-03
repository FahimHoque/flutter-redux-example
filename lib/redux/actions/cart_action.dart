import '../../models/cart/cart.dart';

class AddItemToCartRequest {
  final String uuid;
  AddItemToCartRequest(this.uuid);

  @override
  String toString() {
    return 'AddItemToCartRequest{uuid: $uuid}';
  }
}

class AddItemToCartSuccess {
  final CartItem item;
  AddItemToCartSuccess(this.item);

  @override
  String toString() {
    return 'AddItemToCardSuccess{item: $item}';
  }
}

class AddItemToCartFailed {
  final String error;
  AddItemToCartFailed(this.error);

  @override
  String toString() {
    return 'AddItemToCartFailed{error: $error}';
  }
}

class RemoveItemFromCartRequest {
  final String uuid;
  RemoveItemFromCartRequest(this.uuid);

  @override
  String toString() {
    return 'RemoveItemFromCartRequest{uuid: $uuid}';
  }
}

class FetchCartRequest {
  @override
  String toString() {
    return 'FetchCartRequest{}';
  }
}

class FetchCartSuccess {
  final Cart cart;
  FetchCartSuccess(this.cart);

  @override
  String toString() {
    return 'FetchCartSuccess{cart: $cart}';
  }
}

class FetchCartFailure {
  final String error;
  FetchCartFailure(this.error);

  @override
  String toString() {
    return 'FetchCartFailure{error: $error}';
  }
}
