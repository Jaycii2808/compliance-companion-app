// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      createDate: DateTime.parse(json['createDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      status: $enumDecodeNullable(_$TaskStatusEnumEnumMap, json['status']) ??
          TaskStatusEnum.inProcessing,
      description: json['description'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      isCompleted: json['isCompleted'] as bool? ?? false,
      doneAt: json['doneAt'] == null
          ? null
          : DateTime.parse(json['doneAt'] as String),
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createDate': instance.createDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'status': _$TaskStatusEnumEnumMap[instance.status]!,
      'description': instance.description,
      'notes': instance.notes,
      'isCompleted': instance.isCompleted,
      'doneAt': instance.doneAt?.toIso8601String(),
    };

const _$TaskStatusEnumEnumMap = {
  TaskStatusEnum.inProcessing: 'inProcessing',
  TaskStatusEnum.completed: 'completed',
  TaskStatusEnum.pending: 'pending',
};
