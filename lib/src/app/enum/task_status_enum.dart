enum TaskStatusEnum {
  inProcessing,
  completed,
  pending,
}

extension TaskStatusExtension on TaskStatusEnum {
  String toShortString() {
    switch (this) {
      case TaskStatusEnum.inProcessing:
        return 'In Process';
      case TaskStatusEnum.completed:
        return 'Completed';
      case TaskStatusEnum.pending:
        return 'Pending';
    }
  }

  static TaskStatusEnum fromShortString(String status) {
    return TaskStatusEnum.values.firstWhere((e) => e.toShortString() == status);
  }
}