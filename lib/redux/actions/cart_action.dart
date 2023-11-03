import '../../models/cart/cart.dart';

class AddItemToCardRequest {
  final String uuid;
  AddItemToCardRequest(this.uuid);

  @override
  String toString() {
    return 'AddItemToCardRequest{uuid: $uuid}';
  }
}

class AddItemToCardSuccess {
  final CartItem item;
  AddItemToCardSuccess(this.item);

  @override
  String toString() {
    return 'AddItemToCardSuccess{item: $item}';
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
  final Object error;
  FetchCartFailure(this.error);

  @override
  String toString() {
    return 'FetchCartFailure{error: $error}';
  }
}
