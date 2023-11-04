import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:reselect/reselect.dart';
import 'package:todoapp/api/todo_api.dart';
import 'package:todoapp/redux/store/appstate.dart';
import 'package:todoapp/redux/actions/todo_action.dart';

import '../../models/todo/todo.dart';
import '_add_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      StoreProvider.of<AppState>(context).dispatch(FetchToDosRequested());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.red,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                useRootNavigator: true,
                builder: (context) {
                  return const AddToDoForm();
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            onPressed: () async {
              ToDoApi.deleteAll();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: body(),
      ),
    );
  }

  Widget body() {
    return StoreConnector<AppState, _HomeVM>(
      converter: (store) {
        return _HomeVM(
          isLoading: isLoadingSelector(store.state),
          todos: todosSelector(store.state),
        );
      },
      builder: (context, vm) {
        if (vm.isLoading) {
          return loader();
        } else {
          return ListView.builder(
            itemCount: vm.todos.length,
            itemBuilder: (context, index) {
              final todo = vm.todos[index];
              return ListTile(
                title: Text(todo.name),
                subtitle: Text(todo.description),
                trailing: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) {
                    final newTodo = todo.copyWith(isCompleted: value!);
                    StoreProvider.of<AppState>(context)
                        .dispatch(ToggleToDoRequested(newTodo));
                  },
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget loader() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}

final isLoadingSelector = createSelector1(
  (AppState state) => state.isLoading,
  (bool isLoading) {
    log('isLoadingSelector: $isLoading');
    return isLoading;
  },
);

final todosSelector = createSelector1(
  (AppState state) => state.todos,
  (List<ToDo> todos) => todos,
);

class _HomeVM {
  final bool isLoading;
  final List<ToDo> todos;
  _HomeVM({
    required this.isLoading,
    required this.todos,
  });
}
