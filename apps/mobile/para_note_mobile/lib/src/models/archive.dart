import 'package:freezed_annotation/freezed_annotation.dart';

part 'archive.freezed.dart';
part 'archive.g.dart';

enum ArchiveType { project, area, resource }

@freezed
class Retrospective with _$Retrospective {
  const factory Retrospective({
    @Default([]) List<String> whatWentWell,
    @Default([]) List<String> whatToImprove,
    @Default([]) List<String> lessonsLearned,
  }) = _Retrospective;

  factory Retrospective.fromJson(Map<String, dynamic> json) => _$RetrospectiveFromJson(json);
}

@freezed
class Archive with _$Archive {
  const factory Archive({
    required String id,
    required ArchiveType originalType,
    required String originalId,
    required String title,
    required String description,
    required DateTime archivedAt,
    String? completionNote,
    Retrospective? retrospective,
  }) = _Archive;

  factory Archive.fromJson(Map<String, dynamic> json) => _$ArchiveFromJson(json);
}

extension ArchiveX on Archive {
  String get typeIcon {
    switch (originalType) {
      case ArchiveType.project:
        return '✅';
      case ArchiveType.area:
        return '🎯';
      case ArchiveType.resource:
        return '📚';
    }
  }

  String get monthYear {
    return '${archivedAt.year}년 ${archivedAt.month}월';
  }
}
