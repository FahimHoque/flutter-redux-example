import 'package:redux_saga/redux_saga.dart';
import 'package:todoapp/redux/actions/product_action.dart';

import '../api/product_api.dart';

class ProductSagas {
  fetchProducts({dynamic action}) sync* {
    yield Try(
      () sync* {
        var result = Result();
        yield Call(() {
          return ProductApi.getAllProducts();
        }, result: result);
        yield Put(GetProductsSuccess(result.value));
      },
      Catch: (e, s) sync* {
        yield Put(GetProductsFailure(e));
      },
    );
  }

  productRootSaga() sync* {
    yield TakeEvery(fetchProducts, pattern: GetProductsRequested);
  }
}
