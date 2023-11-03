import '../product/product.dart';

class CartItem {
  final String name;
  final double price;
  final int quantity;

  CartItem(this.name, this.price, this.quantity);

  CartItem.fromProduct(Product product)
      : name = product.name,
        price = product.price,
        quantity = 1;

  double get total => price * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(name, price, quantity ?? this.quantity);
  }

  @override
  String toString() {
    return 'CartItem{name: $name, price: $price, quantity: $quantity}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          price == other.price &&
          quantity == other.quantity;

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ quantity.hashCode;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      json['name'],
      json['price'],
      json['quantity'],
    );
  }
}

class Cart {
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  int get itemCount => _items.length;

  double get total =>
      _items.values.fold(0, (total, current) => total + current.total);

  Cart.empty();

  Cart add(Product product) {
    if (_items.containsKey(product.uuid)) {
      _items[product.uuid] = _items[product.uuid]!
          .copyWith(quantity: _items[product.uuid]!.quantity + 1);
    } else {
      _items[product.uuid] = CartItem.fromProduct(product);
    }
    return this;
  }

  CartItem? get(String uuid) {
    return _items[uuid];
  }

  void remove(Product product) {
    if (_items.containsKey(product.uuid)) {
      if (_items[product.uuid]!.quantity > 1) {
        _items[product.uuid] = _items[product.uuid]!
            .copyWith(quantity: _items[product.uuid]!.quantity - 1);
      } else {
        _items.remove(product.uuid);
      }
    }
  }

  void clear() {
    _items.clear();
  }
}
