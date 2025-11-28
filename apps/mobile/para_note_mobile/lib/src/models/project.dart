import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

enum Priority { high, medium, low }

enum ProjectStatus { active, completed, archived }

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
    @Default(false) bool isCompleted,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

@freezed
class Project with _$Project {
  const factory Project({
    required String id,
    required String title,
    required String description,
    required Priority priority,
    @Default(ProjectStatus.active) ProjectStatus status,
    DateTime? dueDate,
    @Default(0) int progress,
    @Default([]) List<Task> tasks,
    String? linkedAreaId,
    @Default([]) List<String> linkedResourceIds,
    @Default([]) List<String> tags,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? completedAt,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
}

extension ProjectX on Project {
  int get daysUntilDue {
    if (dueDate == null) return 999;
    final now = DateTime.now();
    final difference = dueDate!.difference(now);
    return difference.inDays;
  }

  String get daysUntilDueText {
    final days = daysUntilDue;
    if (days < 0) return 'D+${-days}';
    return 'D-$days';
  }

  int get completedTasksCount {
    return tasks.where((task) => task.isCompleted).length;
  }

  int get totalTasksCount {
    return tasks.length;
  }

  double get calculatedProgress {
    if (tasks.isEmpty) return progress.toDouble();
    return (completedTasksCount / totalTasksCount * 100);
  }
}
