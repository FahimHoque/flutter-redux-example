import 'package:todoapp/models/product/product.dart';
import 'package:todoapp/models/todo/todo.dart';

class ApplicationState {
  final List<ToDo> todos;
  final List<Product> products;

  ApplicationState(this.todos, this.products);

  factory ApplicationState.initial() {
    return ApplicationState(
      [],
      [],
    );
  }

  ApplicationState copyWith({List<ToDo>? todos, List<Product>? products}) {
    return ApplicationState(
      todos ?? this.todos,
      products ?? this.products,
    );
  }
}
