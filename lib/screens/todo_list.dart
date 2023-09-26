// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_api/screens/add_page.dart';
import 'package:todo_app_api/widgets/custom_text_font.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  var obj;
  bool isLoading = true;

  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoPage(),
    );
    Navigator.push(context, route);
  }

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  Future<void> fetchTodo() async {
    var response = await Dio().get(
      "https://api.nstack.in/v1/todos?page=1&limit=10",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      setState(() {
        obj = response.data["items"] as List;
        isLoading = false;
      });
    } else {
      print(response.statusCode);
    }
  }

  Future<void> deleteById(String id) async {
    var response = await Dio().delete(
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      "https://api.nstack.in/v1/todos/$id",
    );
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomFontNormal(
            text: 'Todo App', fontSize: 20, align: TextAlign.center),
        actions: const [],
      ),
      body: isLoading
          ? Center(
              child: Text('Loading..'),
            )
          : RefreshIndicator(
              onRefresh: fetchTodo,
              child: ListView.builder(
                itemCount: obj.length,
                itemBuilder: (context, index) {
                  final item = obj[index];
                  final id = item['_id'] as String;
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      item['title'],
                    ),
                    // subtitle: Text(
                    //   item['description'],
                    // ),
                    trailing: PopupMenuButton(
                      onSelected: (value) {
                        if (value == 'edit') {
                        } else if (value == 'delete') {
                          deleteById(id);
                        }
                      },
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                            value: 'edit',
                            child: CustomFontNormal(
                              text: 'Edit',
                              fontSize: 15,
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: CustomFontNormal(
                              text: 'Delete',
                              fontSize: 15,
                            ),
                          ),
                        ];
                      },
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        label: const CustomFontNormal(text: 'Add Todo', fontSize: 15),
        onPressed: navigateToAddPage,
      ),
    );
  }
}
