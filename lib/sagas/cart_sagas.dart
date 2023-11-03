import 'dart:developer';

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
          log('Calling CartApi.addToCart($uuid)');
          return CartApi().addToCart(uuid);
        }, result: result);
        yield Put(AddItemToCartSuccess(result.value));
      },
      Catch: (e, s) sync* {
        log('addToCart failed: $e');
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

  cartRootSaga() sync* {
    yield TakeEvery(addToCart, pattern: AddItemToCartRequest);
    yield TakeEvery(fetchCart, pattern: FetchCartRequest);
  }
}
