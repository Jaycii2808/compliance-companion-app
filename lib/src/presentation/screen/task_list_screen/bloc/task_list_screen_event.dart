part of 'task_list_screen_bloc.dart';

abstract class TaskListEvent extends Equatable {
  const TaskListEvent();

  @override
  List<Object?> get props => [];
}

class InitListTaskEvent extends TaskListEvent {
  const InitListTaskEvent();
}

class MarkTaskComplete extends TaskListEvent {
  final int index;
  final bool newStatus;
  final TaskModel currentTask;

  const MarkTaskComplete(this.newStatus,
      this.index,
      this.currentTask,);

  @override
  List<Object?> get props =>
      [
        index,
        newStatus,
        currentTask,
      ];
}

class RemoveTaskEvent extends TaskListEvent {
  final List<TaskModel> listTask;
  final TaskModel itemSelected;

  const RemoveTaskEvent(this.listTask,
      this.itemSelected,);

  @override
  List<Object?> get props =>
      [
        listTask,
        itemSelected,
      ];
}

class UpdateTaskEvent extends TaskListEvent {}

class ProcessCreateTaskEvent extends TaskListEvent {}

class CreateTaskEvent extends TaskListEvent {
  final TaskModel newTask;

  const CreateTaskEvent(this.newTask);
}

class CancelCreateTaskEvent extends TaskListEvent {
  const CancelCreateTaskEvent();
}
