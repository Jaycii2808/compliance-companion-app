import 'package:compliance_companion/src/data/model/task_model.dart';
import 'package:compliance_companion/src/presentation/screen/task_detail_screen/task_detail_screen.dart';
import 'package:compliance_companion/src/presentation/screen/task_list_screen/bloc/task_list_screen_bloc.dart';
import 'package:compliance_companion/src/presentation/widgets/task_item.dart';
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
    with AutomaticKeepAliveClientMixin {
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
              return _buildListTask(state.completedTask);
            }
            return const SizedBox.shrink();
          },
          listener: (context, state) {}),
    );
  }

  Widget _buildListTask(List<TaskModel> completedTasks) {
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
              _openTaskDetail(
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

  void _openTaskDetail(BuildContext context, int index,
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

  @override
  bool get wantKeepAlive => true;
}
