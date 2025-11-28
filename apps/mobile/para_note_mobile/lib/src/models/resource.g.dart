// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResourceImpl _$$ResourceImplFromJson(Map<String, dynamic> json) =>
    _$ResourceImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      type: $enumDecode(_$ResourceTypeEnumMap, json['type']),
      content: json['content'] as String,
      thumbnail: json['thumbnail'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      linkedProjectIds: (json['linkedProjectIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      linkedAreaIds: (json['linkedAreaIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isFavorite: json['isFavorite'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      accessedAt: DateTime.parse(json['accessedAt'] as String),
    );

Map<String, dynamic> _$$ResourceImplToJson(_$ResourceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$ResourceTypeEnumMap[instance.type]!,
      'content': instance.content,
      'thumbnail': instance.thumbnail,
      'tags': instance.tags,
      'linkedProjectIds': instance.linkedProjectIds,
      'linkedAreaIds': instance.linkedAreaIds,
      'isFavorite': instance.isFavorite,
      'createdAt': instance.createdAt.toIso8601String(),
      'accessedAt': instance.accessedAt.toIso8601String(),
    };

const _$ResourceTypeEnumMap = {
  ResourceType.document: 'document',
  ResourceType.link: 'link',
  ResourceType.image: 'image',
  ResourceType.video: 'video',
  ResourceType.note: 'note',
};
