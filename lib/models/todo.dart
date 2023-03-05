class Todo{
  String? id;
  String title;
  bool isDone;
  Todo({
    this.id,
    required this.title,
    this.isDone = false,
  });

  static List<Todo> todoList(){
    return [
      Todo(
        id: '1',
        title: 'Todo Item 1',
      ),
      Todo(
        id: '2',
        title: 'Todo Item 2',
        isDone: true,
      ),
      Todo(
        id: '3',
        title: 'Todo Item 3',
      ),
      Todo(
        id: '4',
        title: 'Todo Item 4',
        isDone: true,
      ),
      Todo(
        id: '5',
        title: 'Todo Item 5',
        isDone: true,
      ),
      Todo(
        id: '6',
        title: 'Todo Item 6',
      ),
      Todo(
        id: '7',
        title: 'Todo Item 7',
        isDone: true,
      ),
      Todo(
        id: '8',
        title: 'Todo Item 8',
      ),
      Todo(
        id: '9',
        title: 'Todo Item 9',
        isDone: true,
      ),
      Todo(
        id: '10',
        title: 'Todo Item 10',
        isDone: true,
      ),
    ];
  }
}