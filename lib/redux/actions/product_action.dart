import '../../models/product/product.dart';

class FetchProductRequest {
  FetchProductRequest();
}

class FetchProductSuccess {
  final List<Product> products;
  FetchProductSuccess(this.products);
}

class FetchProductFailure {
  final String error;
  FetchProductFailure(this.error);
}
