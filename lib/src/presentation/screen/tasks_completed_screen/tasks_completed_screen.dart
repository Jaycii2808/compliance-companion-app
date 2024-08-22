import 'package:compliance_companion/src/presentation/screen/task_list_screen/bloc/task_list_screen_bloc.dart';
import 'package:compliance_companion/src/presentation/screen/tasks_completed_screen/tasks_completed_screen_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCompletedScreen extends StatefulWidget {
  const TaskCompletedScreen({
    super.key,
  });

  @override
  State<TaskCompletedScreen> createState() => _TaskCompletedScreenState();
}

class _TaskCompletedScreenState extends State<TaskCompletedScreen>
    with
        AutomaticKeepAliveClientMixin,
        TasksCompletedScreenMixin<TaskCompletedScreen> {
  @override
  Widget build(context) {
    super.build(context);
    return Scaffold(
      body: BlocConsumer<TaskListScreenBloc, TaskListState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: Text('Loading'));
            } else if (state is InitTaskListSuccess ||
                state is MarkTaskCompletedSuccess ||
                state is CancelCreate ||
                state is CreateTaskSuccess) {
              return buildListTask(state.completedTask);
            }
            return const SizedBox.shrink();
          },
          listener: (context, state) {}),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
