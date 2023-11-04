import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../models/todo/todo.dart';
import '../../redux/actions/todo_action.dart';
import '../../redux/store/appstate.dart';

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

              StoreProvider.of<AppState>(context)
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
