import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todoapp/ui/navigation/navigation_page.dart';

import 'redux/store/appstate.dart';

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NavigationPage(),
      ),
    );
  }
}
