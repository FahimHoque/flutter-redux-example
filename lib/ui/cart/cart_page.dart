import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todoapp/redux/actions/cart_action.dart';

import '../../store/appstate.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      StoreProvider.of<ApplicationState>(context)
          .dispatch((FetchCartRequest()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Cart', style: TextStyle(color: Colors.black)),
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container();
  }
}