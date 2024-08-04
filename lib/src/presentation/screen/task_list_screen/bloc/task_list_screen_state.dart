part of 'task_list_screen_bloc.dart';

abstract class TaskListState extends Equatable {
  final List<TaskModel> taskList;
  final List<TaskModel> completedTask;

  const TaskListState({
    required this.completedTask,
    required this.taskList,
  });

  @override
  List<Object?> get props => [
        completedTask,
        taskList,
      ];
}

class Loading extends TaskListState {
  const Loading({required super.completedTask, required super.taskList});
}

class MarkTaskCompletedSuccess extends TaskListState {
  final TaskModel taskMarkCompleted;

  const MarkTaskCompletedSuccess(
    this.taskMarkCompleted, {
    required super.completedTask,
    required super.taskList,
  });

  @override
  List<Object?> get props => [
        taskMarkCompleted,
        completedTask,
        taskList,
      ];
}

class RemoveTaskSuccess extends TaskListState {
  const RemoveTaskSuccess({
    required super.completedTask,
    required super.taskList,
  });
}

class InitTaskListSuccess extends TaskListState {
  const InitTaskListSuccess({
    required super.completedTask,
    required super.taskList,
  });
}

class ProcessCreateTask extends TaskListState {
  final int index;
  const ProcessCreateTask(this.index, {
    required super.completedTask,
    required super.taskList,
  });
}

class CreateTaskSuccess extends TaskListState {
  const CreateTaskSuccess({
    required super.completedTask,
    required super.taskList,
  });
}

class CancelCreate extends TaskListState {
  const CancelCreate({
    required super.completedTask,
    required super.taskList,
  });
}
