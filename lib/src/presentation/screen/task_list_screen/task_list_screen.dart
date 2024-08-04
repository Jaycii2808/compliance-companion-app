import 'package:compliance_companion/src/data/model/task_model.dart';
import 'package:compliance_companion/src/presentation/screen/task_detail_screen/task_detail_screen.dart';
import 'package:compliance_companion/src/presentation/screen/task_list_screen/bloc/task_list_screen_bloc.dart';
import 'package:compliance_companion/src/presentation/widgets/task_item.dart';
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
    with AutomaticKeepAliveClientMixin {
  late List<TaskModel> _list;
  TaskModel? _selectedItem;
  bool isTaskCompleted = false;
  late TaskListScreenBloc taskListBloc;
  List<TaskModel> completedTasks = [];

  @override
  void initState() {
    super.initState();
    taskListBloc = BlocProvider.of<TaskListScreenBloc>(context);
    taskListBloc.add(const InitListTaskEvent());
  }

  void _openTaskDetail(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskDetailScreen(
          task: _list[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<TaskListScreenBloc, TaskListState>(
          listener: (context, state) {
            if (state is ProcessCreateTask) {
              _showTaskInputDialog(state.index);
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
              _list = state.taskList;
              return _buildTaskList();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Widget _buildTaskList() {
    return _list.isEmpty
        ? const Center(
            child: Text('Empty Task'),
          )
        : ListView.builder(
            itemCount: _list.length,
            itemBuilder: _buildItem,
          );
  }

  Widget _buildItem(
    BuildContext context,
    int index,
  ) {
    if (index > _list.length - 1) {
      return const SizedBox.shrink();
    }
    return _list.isEmpty
        ? const Center(
            child: Text('Empty Task'),
          )
        : TaskItem(
            dataModel: _list[index],
            selected: _selectedItem == _list[index],
            onTap: () {
              _openTaskDetail(context, index);
            },
            onCheckComplete: () {
              context.read<TaskListScreenBloc>().add(
                    MarkTaskComplete(
                      !_list[index].isCompleted,
                      index,
                      _list[index],
                    ),
                  );
            },
            isLastItem: (index + 1) == _list.length,
          );
  }

  Future<TaskModel?> _showTaskInputDialog(int nextIndex) {
    final titleController = TextEditingController();
    final dueDateController = TextEditingController();
    final descriptionController = TextEditingController();
    final notesController = TextEditingController();
    DateTime? selectedDate;

    return showDialog<TaskModel>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('New Task'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: dueDateController,
                  decoration: const InputDecoration(
                    labelText: 'Due Date',
                    hintText: 'YYYY-MM-DD',
                  ),
                  readOnly: true,
                  onTap: () async {
                    final DateTime? pickedDate = await showDateTimePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                        dueDateController.text = pickedDate
                            .toLocal()
                            .toIso8601String()
                            .split('T')[0];
                      });
                    }
                  },
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                TextField(
                  controller: notesController,
                  decoration: const InputDecoration(labelText: 'Notes'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                taskListBloc.add(const CancelCreateTaskEvent());
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: () {
                final String title = titleController.text;
                if (title.isNotEmpty && selectedDate != null) {
                  final TaskModel newTask = TaskModel(
                    id: nextIndex,
                    title: title,
                    dueDate: selectedDate!,
                    description: descriptionController.text,
                    notes: notesController.text,
                  );
                  // _processCreateNewTask(newTask);
                  taskListBloc.add(CreateTaskEvent(newTask));
                  Navigator.of(context).pop();
                }
              },
              child: const Text(
                'Add',
              ),
            ),
          ],
        );
      },
    );
  }

  Future<DateTime?> showDateTimePicker({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    initialDate ??= DateTime.now();
    firstDate ??= initialDate.subtract(const Duration(days: 365 * 100));
    lastDate ??= firstDate.add(const Duration(days: 365 * 200));

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate == null) return null;

    if (!mounted) return selectedDate;

    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDate),
    );

    return selectedTime == null
        ? selectedDate
        : DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          );
  }

  @override
  bool get wantKeepAlive => true;
}
