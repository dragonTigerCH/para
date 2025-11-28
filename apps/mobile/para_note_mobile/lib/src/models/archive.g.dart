// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RetrospectiveImpl _$$RetrospectiveImplFromJson(Map<String, dynamic> json) =>
    _$RetrospectiveImpl(
      whatWentWell: (json['whatWentWell'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      whatToImprove: (json['whatToImprove'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lessonsLearned: (json['lessonsLearned'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RetrospectiveImplToJson(_$RetrospectiveImpl instance) =>
    <String, dynamic>{
      'whatWentWell': instance.whatWentWell,
      'whatToImprove': instance.whatToImprove,
      'lessonsLearned': instance.lessonsLearned,
    };

_$ArchiveImpl _$$ArchiveImplFromJson(Map<String, dynamic> json) =>
    _$ArchiveImpl(
      id: json['id'] as String,
      originalType: $enumDecode(_$ArchiveTypeEnumMap, json['originalType']),
      originalId: json['originalId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      archivedAt: DateTime.parse(json['archivedAt'] as String),
      completionNote: json['completionNote'] as String?,
      retrospective: json['retrospective'] == null
          ? null
          : Retrospective.fromJson(
              json['retrospective'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArchiveImplToJson(_$ArchiveImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'originalType': _$ArchiveTypeEnumMap[instance.originalType]!,
      'originalId': instance.originalId,
      'title': instance.title,
      'description': instance.description,
      'archivedAt': instance.archivedAt.toIso8601String(),
      'completionNote': instance.completionNote,
      'retrospective': instance.retrospective,
    };

const _$ArchiveTypeEnumMap = {
  ArchiveType.project: 'project',
  ArchiveType.area: 'area',
  ArchiveType.resource: 'resource',
};
