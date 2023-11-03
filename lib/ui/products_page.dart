import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todoapp/redux/actions/product_action.dart';

import '../store/appstate.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      StoreProvider.of<ApplicationState>(context)
          .dispatch(FetchProductRequest());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return StoreConnector<ApplicationState, ApplicationState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            final product = state.products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text(product.description),
              isThreeLine: true,
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {},
              ),
            );
          },
        );
      },
    );
  }
}
