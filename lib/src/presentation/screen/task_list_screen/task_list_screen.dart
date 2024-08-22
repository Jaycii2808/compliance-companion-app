import 'package:compliance_companion/src/presentation/screen/task_list_screen/bloc/task_list_screen_bloc.dart';
import 'package:compliance_companion/src/presentation/screen/task_list_screen/task_list_screen_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({
    super.key,
  });

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen>
    with TaskListScreenMixin<TaskListScreen>, AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<TaskListScreenBloc, TaskListState>(
          listener: (context, state) {
            if (state is ProcessCreateTask) {
              showTaskInputDialog(state.index);
            }
          },
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is InitTaskListSuccess ||
                state is MarkTaskCompletedSuccess ||
                state is RemoveTaskSuccess ||
                state is CancelCreate ||
                state is CreateTaskSuccess) {
              list = state.taskList;
              return buildTaskList();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
