import 'package:compliance_companion/src/app/enum/task_status_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  final int id;
  final String title;
  final DateTime createDate;
  final DateTime? endDate;
  final TaskStatusEnum status;
  final String description;
  final String notes;
  final bool isCompleted;
  final DateTime? doneAt;

  const TaskModel({
    required this.id,
    required this.title,
    required this.createDate,
    this.endDate,
    this.status = TaskStatusEnum.inProcessing,
    this.description = '',
    this.notes = '',
    this.isCompleted = false,
    this.doneAt,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    DateTime? createDate,
    DateTime? endDate,
    TaskStatusEnum? status,
    String? description,
    String? notes,
    bool? isCompleted,
    DateTime? doneAt,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      createDate: createDate ?? this.createDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      description: description ?? this.description,
      notes: notes ?? this.notes,
      isCompleted: isCompleted ?? this.isCompleted,
      doneAt: doneAt ?? this.doneAt,
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return _$TaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}