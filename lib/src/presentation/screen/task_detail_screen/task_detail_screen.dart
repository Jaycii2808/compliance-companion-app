import 'package:compliance_companion/src/app/constant/string_util.dart';
import 'package:compliance_companion/src/app/enum/task_status_enum.dart';
import 'package:compliance_companion/src/data/model/task_model.dart';
import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget {
  final TaskModel task;

  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Due Date: ${task.dueDate.toString().toFormattedDateTime()}'),
            const SizedBox(height: 8),
            Text('Status: ${task.status.toShortString()}'),
            const SizedBox(height: 8),
            if (task.description.isNotEmpty) ...[
              Text('Description: ${task.description}'),
              const SizedBox(height: 8),
            ],
            if (task.notes.isNotEmpty) ...[
              Text('Notes: ${task.notes}'),
            ],
          ],
        ),
      ),
    );
  }
}
