// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo_app_api/screens/add_page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoPage(),
    );
    Navigator.push(context, route); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        child: const Icon(Icons.add),
        onPressed: navigateToAddPage,
      ),
    );
  }
}
