// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void _submitData() async {
    final title = titleController.text;
    final description = descriptionController.text;

    if (title.isEmpty || description.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'please make sure a valid title and description was entered'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }
    var response = await Dio().post("https://api.nstack.in/v1/todos",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: json.encode({
          "title": title,
          "description": description,
          "is_completed": false,
        }));
    if (response.statusCode == 201) {
      print('Creation succes');
    } else {
      print('Creation failed');
      print(response.data);
    }
    Map obj = response.data;
  }

  void showSuccessMessage() {
    ScaffoldMessenger.of(context)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: 'Description',
            ),
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: _submitData,
            child: const Text("Submit"),
          )
        ],
      ),
    );
  }
}
