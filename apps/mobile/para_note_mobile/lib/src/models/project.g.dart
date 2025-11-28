// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
    };

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      status: $enumDecodeNullable(_$ProjectStatusEnumMap, json['status']) ??
          ProjectStatus.active,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      progress: (json['progress'] as num?)?.toInt() ?? 0,
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      linkedAreaId: json['linkedAreaId'] as String?,
      linkedResourceIds: (json['linkedResourceIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'priority': _$PriorityEnumMap[instance.priority]!,
      'status': _$ProjectStatusEnumMap[instance.status]!,
      'dueDate': instance.dueDate?.toIso8601String(),
      'progress': instance.progress,
      'tasks': instance.tasks,
      'linkedAreaId': instance.linkedAreaId,
      'linkedResourceIds': instance.linkedResourceIds,
      'tags': instance.tags,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
    };

const _$PriorityEnumMap = {
  Priority.high: 'high',
  Priority.medium: 'medium',
  Priority.low: 'low',
};

const _$ProjectStatusEnumMap = {
  ProjectStatus.active: 'active',
  ProjectStatus.completed: 'completed',
  ProjectStatus.archived: 'archived',
};
