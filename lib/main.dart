import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Passing Data',
    home: TodosScreen(
      todos: [
        Todo('• Saludar a Steven', 'Saludar a mi amigo Steven'),
        Todo('• Comprar la comida del mono', 'Ir a comprarle la comida al michi'),
        Todo('• Escuchar 1989 Taylor´s Version', 'Escuchar la regrabacion de 1989 TV el 27/10/2023'),
        Todo('• Estudiar para el examen', 'Preparar para el examen de Granadeño'),
        Todo('• Ir al oftalmólogo', 'cita con el oftalmólogo 09:30 AM'),
      ],
    ),
  ));
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formas de pasar parámetros de una pantalla a otra',
          style: TextStyle(fontSize: 16.5),
        ),
        backgroundColor: const Color.fromARGB(255, 243, 33, 33),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Lista de Tareas',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(todo: todos[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;

  DetailScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
        backgroundColor: const Color.fromARGB(255, 243, 33, 33),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
