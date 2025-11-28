import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';
part 'resource.g.dart';

enum ResourceType { document, link, image, video, note }

@freezed
class Resource with _$Resource {
  const factory Resource({
    required String id,
    required String title,
    required ResourceType type,
    required String content, // URL or text content
    String? thumbnail,
    @Default([]) List<String> tags,
    @Default([]) List<String> linkedProjectIds,
    @Default([]) List<String> linkedAreaIds,
    @Default(false) bool isFavorite,
    required DateTime createdAt,
    required DateTime accessedAt,
  }) = _Resource;

  factory Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);
}

extension ResourceX on Resource {
  String get typeIcon {
    switch (type) {
      case ResourceType.document:
        return '📄';
      case ResourceType.link:
        return '🔗';
      case ResourceType.image:
        return '🖼️';
      case ResourceType.video:
        return '🎥';
      case ResourceType.note:
        return '📝';
    }
  }
}
