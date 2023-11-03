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
        yield Put(FetchProductSuccess(result.value));
      },
      Catch: (e, s) sync* {
        yield Put(FetchProductFailure(e));
      },
    );
  }

  productRootSaga() sync* {
    yield TakeEvery(fetchProducts, pattern: FetchProductRequest);
  }
}
