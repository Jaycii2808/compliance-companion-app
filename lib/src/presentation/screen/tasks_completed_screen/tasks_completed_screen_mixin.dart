import 'package:compliance_companion/src/data/model/task_model.dart';
import 'package:compliance_companion/src/presentation/screen/shared_data.dart';
import 'package:compliance_companion/src/presentation/widgets/task_item.dart';
import 'package:flutter/material.dart';

mixin TasksCompletedScreenMixin<T extends StatefulWidget> on State<T> {
  Widget buildListTask(List<TaskModel> completedTasks) {
    if (completedTasks.isEmpty) {
      return const Center(child: Text('Empty Task'));
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: completedTasks.length,
        itemBuilder: (context, index) {
          final item = completedTasks[index];
          return TaskItem(
            dataModel: item,
            onTap: () {
              openTaskDetail(
                context,
                index,
                completedTasks: completedTasks,
              );
            },
            isLastItem: (index + 1) == completedTasks.length,
          );
        },
      ),
    );
  }

  void openTaskDetail(BuildContext context, int index,
      {required List<TaskModel> completedTasks}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskDetailScreen(
          task: completedTasks[index],
        ),
      ),
    );
  }
}
