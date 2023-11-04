import '../../models/product/product.dart';

class GetProductsRequested {
  GetProductsRequested();
}

class GetProductsSuccess {
  final List<Product> products;
  GetProductsSuccess(this.products);
}

class GetProductsFailure {
  final String error;
  GetProductsFailure(this.error);
}
