import 'package:flutter/material.dart';
import 'package:todo/constants/color.dart';
import 'package:todo/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final onTodoChange;
  final onTodoDelete;

  const TodoItem({Key? key, required this.todo, required this.onTodoChange, required this.onTodoDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          // ignore: avoid_print
          // print('Todo Item');
          onTodoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank, 
          color: tdBlue,
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            color: tdBlack,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(7),
          ),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              onTodoDelete(todo.id);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 20,
            ),
          )
        ),
      ),
    );
  }
}
