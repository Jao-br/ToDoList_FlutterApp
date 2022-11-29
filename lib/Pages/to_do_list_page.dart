// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ToDoListPage extends StatelessWidget {
  ToDoListPage({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail: ',
                ),
              ),
              ElevatedButton(
                onPressed: login,
                child: const Text('Entrar'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    String email = emailController.text;
    print(email);
  }
}
