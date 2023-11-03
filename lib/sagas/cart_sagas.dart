import 'package:redux_saga/redux_saga.dart';
import 'package:todoapp/redux/actions/cart_action.dart';

import '../api/cart_api.dart';

class CartSaga {
  addToCart({dynamic action}) sync* {
    yield Try(
      () sync* {
        var result = Result();
        yield Call(() {
          String uuid = action.uuid as String;

          return CartApi().addToCart(uuid);
        }, result: result);
        yield Put(AddItemToCartSuccess(result.value));
      },
      Catch: (e, s) sync* {
        yield Put(AddItemToCartFailed(e));
      },
    );
  }

  fetchCart({dynamic action}) sync* {
    yield Try(
      () sync* {
        var result = Result();
        yield Call(() {
          return CartApi().getCart();
        }, result: result);
        yield Put(FetchCartSuccess(result.value));
      },
      Catch: (e, s) sync* {
        yield Put(FetchCartFailure(e));
      },
    );
  }

  removeItemFromCart({dynamic action}) sync* {
    yield Try(
      () sync* {
        var result = Result();
        yield Call(() {
          String uuid = action.uuid as String;

          return CartApi().removeFromCart(uuid);
        }, result: result);
        yield Put(RemoveItemFromCartSuccess(result.value));
      },
      Catch: (e, s) sync* {
        yield Put(RemoveItemFromCartFailed(e));
      },
    );
  }

  cartRootSaga() sync* {
    yield TakeEvery(addToCart, pattern: AddItemToCartRequest);
    yield TakeEvery(fetchCart, pattern: FetchCartRequest);
    yield TakeEvery(removeItemFromCart, pattern: RemoveItemFromCartRequest);
  }
}
