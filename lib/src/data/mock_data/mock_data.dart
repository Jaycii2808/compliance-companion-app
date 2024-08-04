import 'package:compliance_companion/src/app/enum/task_status_enum.dart';
import 'package:compliance_companion/src/data/model/task_model.dart';

class MockData {
  static List<TaskModel> get tasks => [
    TaskModel(
      id: 1,
      title: 'Task 1',
      dueDate: DateTime.now().add(const Duration(days: 1)),
      status: TaskStatusEnum.inProcessing,
    ),
    TaskModel(
      id: 2,
      title: 'Task 2',
      dueDate: DateTime.now().add(const Duration(days: 2)),
      status: TaskStatusEnum.inProcessing,
    ),
    TaskModel(
      id: 3,
      title: 'Task 3',
      dueDate: DateTime.now().add(const Duration(days: 3)),
      status: TaskStatusEnum.completed,
      isCompleted: true,
    ),
    TaskModel(
      id: 4,
      title: 'Task 4',
      dueDate: DateTime.now().add(const Duration(days: 3)),
      status: TaskStatusEnum.inProcessing,
    ),
  ];
}