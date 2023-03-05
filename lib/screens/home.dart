import 'package:flutter/material.dart';
import 'package:todo/constants/color.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = Todo.todoList();
  final _todoController = TextEditingController();
  List<Todo> _todos = [];

  @override
  void initState() {
    _todos = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: _buildAppBar(),
      drawer: Drawer(
        elevation: 20.0,
        child: Column(children: const <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Dhiraj Shelke"),
            accountEmail: Text("siesgst@gmail.com"),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                child: Text(" D ")),
          ),
          ListTile(
            title: Text("Inbox"),
            leading: Icon(Icons.mail),
            // onTap: () {
            //   Navigator.pop(context);

            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => Mailpage()),
            //   );
            // },
          ),
          Divider(
            height: 0.1,
          ),
          ListTile(
            title: Text("Services"),
            leading: Icon(Icons.miscellaneous_services),
            // onTap: () {
            //   Navigator.pop(context);

            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => Primarypage()),
            //   );
            // },
          ),
          ListTile(
            title: Text("Community"),
            leading: Icon(Icons.group),
            // onTap: () {
            //   Navigator.pop(context);

            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => Primarypage()),
            //   );
            // },
          ),
          ListTile(
            title: Text("Contact"),
            leading: Icon(Icons.contact_page),
          ),
        ]),
      ),
      body: Stack(
        children: [
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shrinkWrap: true,
            children: [
              searchBox(),
              Container(
                margin: const EdgeInsets.only(top: 50, bottom: 20),
                child: const Text(
                  "All Todo's",
                  style: TextStyle(
                    color: tdBlack,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              for (Todo todo in _todos)
                TodoItem(
                    todo: todo,
                    onTodoChange: _handleTodoChange,
                    onTodoDelete: _handleTodoDelete),
              // const TodoItem(),
            ],
          )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add new todo',
                        prefixIcon: Icon(
                          Icons.add,
                          color: tdGrey,
                        ),
                      ),
                    ),
                  )),
                  Container(
                    margin: const EdgeInsets.only(right: 20, bottom: 20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: tdBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(0),
                      ),
                      onPressed: () {
                        _addTodo(_todoController.text);
                      },
                      child: const Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleTodoDelete(String id) {
    setState(() {
      todosList.removeWhere((element) => element.id == id);
    });
  }

  void _addTodo(String todo) {
    setState(() {
      todosList.add(Todo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: todo,
        isDone: false,
      ));
    });
    _todoController.clear();
  }

  void _filter(String enterElement) {
    List<Todo> results = [];
    if (enterElement.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((element) => element.title.contains(enterElement))
          .toList();
    }

    setState(() {
      _todos = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _filter(value),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search,
            color: tdGrey,
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBgColor,
      iconTheme: const IconThemeData(color: tdBlack),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(''),
          // IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {},
          // ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/avatar3.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
