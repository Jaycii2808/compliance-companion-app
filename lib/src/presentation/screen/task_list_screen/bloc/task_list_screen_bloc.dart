import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:compliance_companion/src/app/enum/task_status_enum.dart';
import 'package:compliance_companion/src/data/mock_data/mock_data.dart';
import 'package:compliance_companion/src/data/model/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'task_list_screen_event.dart';

part 'task_list_screen_state.dart';

@injectable
class TaskListScreenBloc extends Bloc<TaskListEvent, TaskListState> {
  TaskListScreenBloc() : super(const Loading(completedTask: [], taskList: [])) {
    on<MarkTaskComplete>(_markTaskCompleted);
    on<RemoveTaskEvent>(_removeTaskFromList);
    on<InitListTaskEvent>(_processInitList);
    on<ProcessCreateTaskEvent>(_processCreateTask);
    on<CreateTaskEvent>(_createTask);
    on<CancelCreateTaskEvent>(_cancelCreateTask);
  }

  void _markTaskCompleted(MarkTaskComplete event, Emitter<TaskListState> emit) {
    final currentState = state;
    emit(Loading(
      completedTask: currentState.completedTask,
      taskList: currentState.taskList,
    ));
    final updatedTask = event.currentTask.copyWith(
      isCompleted: true,
      status: TaskStatusEnum.completed,
    );
    currentState.taskList.remove(event.currentTask);
    currentState.completedTask.add(updatedTask);
    emit(
      MarkTaskCompletedSuccess(
        updatedTask,
        completedTask: currentState.completedTask,
        taskList: currentState.taskList,
      ),
    );
  }

  void _removeTaskFromList(RemoveTaskEvent event, Emitter<TaskListState> emit) {
    final currentState = state;
    emit(Loading(
      completedTask: currentState.completedTask,
      taskList: currentState.taskList,
    ));
    currentState.taskList.remove(event.itemSelected);
    emit(RemoveTaskSuccess(
      completedTask: currentState.completedTask,
      taskList: currentState.taskList,
    ));
  }

  void _processInitList(InitListTaskEvent event, Emitter<TaskListState> emit) {
    final currentState = state;
    emit(Loading(
      completedTask: currentState.completedTask,
      taskList: currentState.taskList,
    ));
    final List<TaskModel> toDoTask = [];
    final List<TaskModel> completedTask = [];

    for (var task in MockData.tasks) {
      if (task.status == TaskStatusEnum.completed) {
        completedTask.add(task);
      } else {
        toDoTask.add(task);
      }
    }
    emit(
      InitTaskListSuccess(
        completedTask: completedTask,
        taskList: toDoTask,
      ),
    );
  }

  void _processCreateTask(
      ProcessCreateTaskEvent event, Emitter<TaskListState> emit) {
    final currentState = state;
    emit(Loading(
      completedTask: currentState.completedTask,
      taskList: currentState.taskList,
    ));
    final currentIndex = currentState.taskList.length + 1;
    emit(
      ProcessCreateTask(
        currentIndex,
        completedTask: currentState.completedTask,
        taskList: currentState.taskList,
      ),
    );
  }

  void _createTask(CreateTaskEvent event, Emitter<TaskListState> emit) {
    final currentState = state;
    emit(Loading(
      completedTask: currentState.completedTask,
      taskList: currentState.taskList,
    ));
    final newListTask = currentState.taskList;
    newListTask.add(event.newTask);
    emit(
      CreateTaskSuccess(
        completedTask: currentState.completedTask,
        taskList: newListTask,
      ),
    );
  }

  void _cancelCreateTask(
      CancelCreateTaskEvent event, Emitter<TaskListState> emit) {
    final currentState = state;
    emit(Loading(
      completedTask: currentState.completedTask,
      taskList: currentState.taskList,
    ));
    emit(CancelCreate(
      completedTask: currentState.completedTask,
      taskList: currentState.taskList,
    ));
  }
}
