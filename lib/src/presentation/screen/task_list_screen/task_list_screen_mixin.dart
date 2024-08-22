import 'package:compliance_companion/src/data/model/task_model.dart';
import 'package:compliance_companion/src/presentation/screen/shared_data.dart';
import 'package:compliance_companion/src/presentation/screen/task_list_screen/bloc/task_list_screen_bloc.dart';
import 'package:compliance_companion/src/presentation/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin TaskListScreenMixin<T extends StatefulWidget> on State<T> {
  late List<TaskModel> list;
  TaskModel? selectedItem;
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
          task: list[index],
        ),
      ),
    );
  }

  Widget buildTaskList() {
    return list.isEmpty
        ? const Center(
            child: Text('Empty Task'),
          )
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: buildItem,
          );
  }

  Widget buildItem(
    BuildContext context,
    int index,
  ) {
    if (index > list.length - 1) {
      return const SizedBox.shrink();
    }
    return list.isEmpty
        ? const Center(
            child: Text('Empty Task'),
          )
        : TaskItem(
            dataModel: list[index],
            selected: selectedItem == list[index],
            onTap: () {
              _openTaskDetail(context, index);
            },
            onCheckComplete: () {
              context.read<TaskListScreenBloc>().add(
                    MarkTaskComplete(
                      !list[index].isCompleted,
                      index,
                      list[index],
                    ),
                  ) ;
            },
            isLastItem: (index + 1) == list.length,
          );
  }

  Future<TaskModel?> showTaskInputDialog(int nextIndex) {
    final titleController = TextEditingController();
    final startDateController = TextEditingController();
    final endDateController = TextEditingController();
    final descriptionController = TextEditingController();
    final notesController = TextEditingController();
    DateTime? selectedStartDate;
    DateTime? selectedEndDate;

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
                  controller: startDateController,
                  decoration: const InputDecoration(
                    labelText: 'Start Date',
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
                        selectedStartDate = pickedDate;
                        startDateController.text = pickedDate
                            .toLocal()
                            .toIso8601String()
                            .split('T')[0];
                      });
                    }
                  },
                ),
                TextField(
                  controller: endDateController,
                  decoration: const InputDecoration(
                    labelText: 'End Date',
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
                        selectedEndDate = pickedDate;
                        endDateController.text = pickedDate
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
                if (title.isNotEmpty && selectedStartDate != null) {
                  final TaskModel newTask = TaskModel(
                    id: nextIndex,
                    title: title,
                    createDate: selectedStartDate!,
                    endDate: selectedEndDate,
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
}
