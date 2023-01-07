import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/Models/task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CompleteListIten extends StatelessWidget {
  const CompleteListIten({
    super.key,
    required this.task,
    required this.onDeleteComplete,
  });

  final Task task;
  final Function(Task) onDeleteComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Slidable(
        // ignore: sort_child_properties_last
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(255, 248, 224, 155),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat.MMMEd().format(task.dateTime),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                ),
              ),
              Text(
                task.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actionExtentRatio: 0.25,
        actionPane: const SlidableDrawerActionPane(),

        secondaryActions: [
          IconSlideAction(
            color: Colors.redAccent,
            icon: Icons.delete,
            onTap: () {
              onDeleteComplete(task);
            },
          )
        ],
      ),
    );
  }
}
