import 'package:compliance_companion/src/app/enum/task_status_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  final int id;
  final String title;
  final DateTime dueDate;
  final TaskStatusEnum status;
  final String description;
  final String notes;
  final bool isCompleted;

  const TaskModel({
    required this.id,
    required this.title,
    required this.dueDate,
    this.status = TaskStatusEnum.inProcessing,
    this.description = '',
    this.notes = '',
    this.isCompleted = false,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    DateTime? dueDate,
    TaskStatusEnum? status,
    String? description,
    String? notes,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      description: description ?? this.description,
      notes: notes ?? this.notes,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return _$TaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}