// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      status: $enumDecodeNullable(_$TaskStatusEnumEnumMap, json['status']) ??
          TaskStatusEnum.inProcessing,
      description: json['description'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'dueDate': instance.dueDate.toIso8601String(),
      'status': _$TaskStatusEnumEnumMap[instance.status]!,
      'description': instance.description,
      'notes': instance.notes,
      'isCompleted': instance.isCompleted,
    };

const _$TaskStatusEnumEnumMap = {
  TaskStatusEnum.inProcessing: 'inProcessing',
  TaskStatusEnum.completed: 'completed',
  TaskStatusEnum.pending: 'pending',
};
