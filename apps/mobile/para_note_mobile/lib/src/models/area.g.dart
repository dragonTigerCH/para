// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetricsImpl _$$MetricsImplFromJson(Map<String, dynamic> json) =>
    _$MetricsImpl(
      type: $enumDecode(_$MetricTypeEnumMap, json['type']),
      current: (json['current'] as num).toDouble(),
      target: (json['target'] as num).toDouble(),
    );

Map<String, dynamic> _$$MetricsImplToJson(_$MetricsImpl instance) =>
    <String, dynamic>{
      'type': _$MetricTypeEnumMap[instance.type]!,
      'current': instance.current,
      'target': instance.target,
    };

const _$MetricTypeEnumMap = {
  MetricType.progress: 'progress',
  MetricType.stars: 'stars',
  MetricType.count: 'count',
};

_$HabitImpl _$$HabitImplFromJson(Map<String, dynamic> json) => _$HabitImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      isCompletedToday: json['isCompletedToday'] as bool? ?? false,
      lastCompletedAt: json['lastCompletedAt'] == null
          ? null
          : DateTime.parse(json['lastCompletedAt'] as String),
    );

Map<String, dynamic> _$$HabitImplToJson(_$HabitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isCompletedToday': instance.isCompletedToday,
      'lastCompletedAt': instance.lastCompletedAt?.toIso8601String(),
    };

_$AreaImpl _$$AreaImplFromJson(Map<String, dynamic> json) => _$AreaImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      icon: json['icon'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      metrics: Metrics.fromJson(json['metrics'] as Map<String, dynamic>),
      habits: (json['habits'] as List<dynamic>?)
              ?.map((e) => Habit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      linkedProjectIds: (json['linkedProjectIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      linkedResourceIds: (json['linkedResourceIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AreaImplToJson(_$AreaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon': instance.icon,
      'description': instance.description,
      'category': instance.category,
      'metrics': instance.metrics,
      'habits': instance.habits,
      'linkedProjectIds': instance.linkedProjectIds,
      'linkedResourceIds': instance.linkedResourceIds,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
