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
        Todo('Comprar leche', 'Comprar leche en la tienda'),
        Todo('Llevar el coche al taller', 'Programar una revisión del coche'),
        Todo('Estudiar para el examen', 'Preparar para el examen de matemáticas'),
        Todo('Hacer ejercicio', 'Ir al gimnasio y hacer ejercicios'),
        Todo('Cita con el médico', 'Consulta médica a las 3 PM'),
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
        title: Text('Formas de pasar parametros de una pantalla a otra', style: TextStyle(fontSize: 16),
      ),),
      body: ListView.builder(
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
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
