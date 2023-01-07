// ignore_for_file: avoid_print
import 'dart:ffi';

import 'package:flutter/material.dart';
import '../Models/task.dart';
import '../widgets/complete_list_iten.dart';
import '../widgets/task_list_iten.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final TextEditingController taskController = TextEditingController();

  List<Task> tasklist = [];
  List<Task> completelist = [];

  Task? deletedTask;
  int? deletedTaskPosition;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Whats your task?',
                          hintText: 'Conquer the World...',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        String text = taskController.text;
                        setState(
                          () {
                            Task newTask = Task(
                              title: text,
                              dateTime: DateTime.now(),
                            );
                            tasklist.add(newTask);
                          },
                        );
                        taskController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[400],
                        padding: const EdgeInsets.all(10),
                      ),
                      child:
                          const Icon(Icons.add, size: 30, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Task task in tasklist)
                        TaskListIten(
                          task: task,
                          onDelete: onDelete,
                          onComplete: onComplete,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text('You have ${tasklist.length} Pending tasks'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[400],
                        padding: const EdgeInsets.all(10),
                      ),
                      child: const Text('Clear TaskChart'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'You have accomplished ${completelist.length} tasks today!',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Task task in completelist)
                        CompleteListIten(
                          task: task,
                          onDeleteComplete: onComplete,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onComplete(Task task) {
    setState(() {
      completelist.add(task);
      tasklist.remove(task);
    });
  }

  void onDelete(Task task) {
    deletedTask = task;
    deletedTaskPosition = tasklist.indexOf(task);

    setState(() {
      tasklist.remove(task);
    });


    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Task "${task.title}" Successfully Deleted',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.amber[900],
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              tasklist.insert(deletedTaskPosition!, deletedTask!);
            });
          },
        ),
      ),
    );
  }

  void onDeleteComplete(Task task) {
    setState(() {
      completelist.remove(task);
    });
  }
}
