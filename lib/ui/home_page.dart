import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todoapp/api/todo_api.dart';
import 'package:todoapp/models/todo/todo.dart';
import 'package:todoapp/redux/appstate.dart';
import 'package:todoapp/redux/actions/todo_action.dart';

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
      StoreProvider.of<ApplicationState>(context)
          .dispatch(FetchToDosRequested());
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
    return StoreConnector<ApplicationState, List<ToDo>>(
      converter: (store) => store.state.todos,
      builder: (context, todos) {
        if (todos.isEmpty) {
          return const Center(
            child: Text('No todos'),
          );
        } else {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.name),
                trailing: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) {
                    StoreProvider.of<ApplicationState>(context)
                        .dispatch(ToggleToDoAction(todo));
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}

class AddToDoForm extends StatefulWidget {
  const AddToDoForm({super.key});

  @override
  State<AddToDoForm> createState() => _AddToDoFormState();
}

class _AddToDoFormState extends State<AddToDoForm> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _textEditingController,
            focusNode: _focusNode,
            decoration: const InputDecoration(
              hintText: 'Enter your todo',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String name = _textEditingController.text;
              ToDo todo = ToDo(
                uuid: DateTime.now().millisecondsSinceEpoch.toString(),
                name: name,
                description: '',
                isCompleted: false,
              );

              StoreProvider.of<ApplicationState>(context)
                  .dispatch(CreateToDoRequested(todo));
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
