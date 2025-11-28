import 'package:freezed_annotation/freezed_annotation.dart';

part 'area.freezed.dart';
part 'area.g.dart';

enum MetricType { progress, stars, count }

@freezed
class Metrics with _$Metrics {
  const factory Metrics({
    required MetricType type,
    required double current,
    required double target,
  }) = _Metrics;

  factory Metrics.fromJson(Map<String, dynamic> json) => _$MetricsFromJson(json);
}

@freezed
class Habit with _$Habit {
  const factory Habit({
    required String id,
    required String title,
    @Default(false) bool isCompletedToday,
    DateTime? lastCompletedAt,
  }) = _Habit;

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);
}

@freezed
class Area with _$Area {
  const factory Area({
    required String id,
    required String title,
    required String icon,
    required String description,
    required String category,
    required Metrics metrics,
    @Default([]) List<Habit> habits,
    @Default([]) List<String> linkedProjectIds,
    @Default([]) List<String> linkedResourceIds,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Area;

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
}

extension AreaX on Area {
  int get completedHabitsToday {
    return habits.where((habit) => habit.isCompletedToday).length;
  }

  int get totalHabits {
    return habits.length;
  }

  double get progressPercentage {
    if (metrics.type == MetricType.progress) {
      return (metrics.current / metrics.target * 100).clamp(0, 100);
    }
    return 0;
  }

  int get starRating {
    if (metrics.type == MetricType.stars) {
      return metrics.current.toInt();
    }
    return 0;
  }
}
