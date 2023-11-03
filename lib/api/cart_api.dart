import 'package:todoapp/api/product_api.dart';
import 'package:todoapp/memdeb/memdb.dart';
import 'package:todoapp/models/cart/cart.dart';
import 'package:todoapp/models/product/product.dart';

class CartApi {
  static const String CART_ID = 'cart_id';

  Future<CartItem> addToCart(String productUuid) async {
    List<Product> products = await ProductApi.getAllProducts();
    Product product =
        products.firstWhere((element) => element.uuid == productUuid);

    Cart cart = await getCart();
    cart.add(product);
    Memdb.set(CART_ID, cart);
    return cart.get(productUuid)!;
  }

  Future<Cart> getCart() async {
    Cart? cart = Memdb.get(CART_ID);
    if (cart == null) {
      cart = Cart.empty();
      Memdb.set(CART_ID, cart);
    }
    return cart;
  }
}
