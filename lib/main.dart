import 'package:flutter/material.dart';
import 'Pages/to_do_list_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoListPage(),
    );
  }
}
