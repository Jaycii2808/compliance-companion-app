import 'package:compliance_companion/src/app/constant/date_time_util.dart';
import 'package:compliance_companion/src/app/constant/string_util.dart';
import 'package:compliance_companion/src/app/enum/task_status_enum.dart';
import 'package:compliance_companion/src/data/model/task_model.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.dataModel,
    this.onCheckComplete,
    this.isLastItem = false,
  });

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool selected;
  final TaskModel? dataModel;
  final Function()? onCheckComplete;
  final bool isLastItem;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isMarksCompleted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headlineMedium!;
    if (widget.selected) {
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: _buildItem(textStyle),
      ),
    );
  }

  Widget _buildItem(TextStyle textStyle) {
    bool isCompleted = widget.dataModel?.isCompleted ?? false;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: Text(
                  widget.dataModel?.title ?? '',
                  style: TextStyle(
                    color: isCompleted ? Colors.greenAccent : Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.dataModel?.description.isNotNullOrEmpty() ==
                        true)
                      Text(
                        widget.dataModel?.description ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          decoration:
                              isCompleted ? TextDecoration.lineThrough : null,
                          decorationColor:
                              isCompleted ? Colors.greenAccent : null,
                          decorationThickness: isCompleted ? 2 : null,
                        ),
                      ),
                    if (!isCompleted) ...[
                      Text(
                        (widget.dataModel?.createDate ?? '')
                            .toString()
                            .toFormattedDateTime(),
                        style: TextStyle(
                          color: isCompleted ? Colors.greenAccent : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '${widget.dataModel?.status.toShortString()}',
                        style: TextStyle(
                          color: isCompleted ? Colors.greenAccent : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                    if (widget.dataModel?.doneAt != null)
                      Row(
                        children: [
                          Text(
                            '${widget.dataModel?.status.toShortString()}',
                            style: const TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            " - ${(widget.dataModel?.doneAt).toString().toFormattedDateTime(dateOnly: true)}",
                            style: TextStyle(
                              color: isCompleted
                                  ? Colors.greenAccent
                                  : Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              IconButton(
                onPressed: widget.onCheckComplete,
                icon: (isCompleted)
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.greenAccent,
                      )
                    : const Icon(Icons.circle_outlined),
              )
            ],
          ),
          if (!widget.isLastItem)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width /
                  1.5, // Expand to fill the width of the parent
              height: 1, // Height of the divider
              color: Colors.grey, // Divider color
            ),
        ],
      ),
    );
  }
}
