// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Metrics _$MetricsFromJson(Map<String, dynamic> json) {
  return _Metrics.fromJson(json);
}

/// @nodoc
mixin _$Metrics {
  MetricType get type => throw _privateConstructorUsedError;
  double get current => throw _privateConstructorUsedError;
  double get target => throw _privateConstructorUsedError;

  /// Serializes this Metrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Metrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetricsCopyWith<Metrics> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetricsCopyWith<$Res> {
  factory $MetricsCopyWith(Metrics value, $Res Function(Metrics) then) =
      _$MetricsCopyWithImpl<$Res, Metrics>;
  @useResult
  $Res call({MetricType type, double current, double target});
}

/// @nodoc
class _$MetricsCopyWithImpl<$Res, $Val extends Metrics>
    implements $MetricsCopyWith<$Res> {
  _$MetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Metrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? current = null,
    Object? target = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MetricType,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as double,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetricsImplCopyWith<$Res> implements $MetricsCopyWith<$Res> {
  factory _$$MetricsImplCopyWith(
          _$MetricsImpl value, $Res Function(_$MetricsImpl) then) =
      __$$MetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MetricType type, double current, double target});
}

/// @nodoc
class __$$MetricsImplCopyWithImpl<$Res>
    extends _$MetricsCopyWithImpl<$Res, _$MetricsImpl>
    implements _$$MetricsImplCopyWith<$Res> {
  __$$MetricsImplCopyWithImpl(
      _$MetricsImpl _value, $Res Function(_$MetricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Metrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? current = null,
    Object? target = null,
  }) {
    return _then(_$MetricsImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MetricType,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as double,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetricsImpl implements _Metrics {
  const _$MetricsImpl(
      {required this.type, required this.current, required this.target});

  factory _$MetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetricsImplFromJson(json);

  @override
  final MetricType type;
  @override
  final double current;
  @override
  final double target;

  @override
  String toString() {
    return 'Metrics(type: $type, current: $current, target: $target)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetricsImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, current, target);

  /// Create a copy of Metrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetricsImplCopyWith<_$MetricsImpl> get copyWith =>
      __$$MetricsImplCopyWithImpl<_$MetricsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetricsImplToJson(
      this,
    );
  }
}

abstract class _Metrics implements Metrics {
  const factory _Metrics(
      {required final MetricType type,
      required final double current,
      required final double target}) = _$MetricsImpl;

  factory _Metrics.fromJson(Map<String, dynamic> json) = _$MetricsImpl.fromJson;

  @override
  MetricType get type;
  @override
  double get current;
  @override
  double get target;

  /// Create a copy of Metrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetricsImplCopyWith<_$MetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Habit _$HabitFromJson(Map<String, dynamic> json) {
  return _Habit.fromJson(json);
}

/// @nodoc
mixin _$Habit {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isCompletedToday => throw _privateConstructorUsedError;
  DateTime? get lastCompletedAt => throw _privateConstructorUsedError;

  /// Serializes this Habit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitCopyWith<Habit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitCopyWith<$Res> {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) then) =
      _$HabitCopyWithImpl<$Res, Habit>;
  @useResult
  $Res call(
      {String id,
      String title,
      bool isCompletedToday,
      DateTime? lastCompletedAt});
}

/// @nodoc
class _$HabitCopyWithImpl<$Res, $Val extends Habit>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isCompletedToday = null,
    Object? lastCompletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompletedToday: null == isCompletedToday
          ? _value.isCompletedToday
          : isCompletedToday // ignore: cast_nullable_to_non_nullable
              as bool,
      lastCompletedAt: freezed == lastCompletedAt
          ? _value.lastCompletedAt
          : lastCompletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitImplCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$$HabitImplCopyWith(
          _$HabitImpl value, $Res Function(_$HabitImpl) then) =
      __$$HabitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      bool isCompletedToday,
      DateTime? lastCompletedAt});
}

/// @nodoc
class __$$HabitImplCopyWithImpl<$Res>
    extends _$HabitCopyWithImpl<$Res, _$HabitImpl>
    implements _$$HabitImplCopyWith<$Res> {
  __$$HabitImplCopyWithImpl(
      _$HabitImpl _value, $Res Function(_$HabitImpl) _then)
      : super(_value, _then);

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isCompletedToday = null,
    Object? lastCompletedAt = freezed,
  }) {
    return _then(_$HabitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompletedToday: null == isCompletedToday
          ? _value.isCompletedToday
          : isCompletedToday // ignore: cast_nullable_to_non_nullable
              as bool,
      lastCompletedAt: freezed == lastCompletedAt
          ? _value.lastCompletedAt
          : lastCompletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HabitImpl implements _Habit {
  const _$HabitImpl(
      {required this.id,
      required this.title,
      this.isCompletedToday = false,
      this.lastCompletedAt});

  factory _$HabitImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final bool isCompletedToday;
  @override
  final DateTime? lastCompletedAt;

  @override
  String toString() {
    return 'Habit(id: $id, title: $title, isCompletedToday: $isCompletedToday, lastCompletedAt: $lastCompletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isCompletedToday, isCompletedToday) ||
                other.isCompletedToday == isCompletedToday) &&
            (identical(other.lastCompletedAt, lastCompletedAt) ||
                other.lastCompletedAt == lastCompletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, isCompletedToday, lastCompletedAt);

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitImplCopyWith<_$HabitImpl> get copyWith =>
      __$$HabitImplCopyWithImpl<_$HabitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitImplToJson(
      this,
    );
  }
}

abstract class _Habit implements Habit {
  const factory _Habit(
      {required final String id,
      required final String title,
      final bool isCompletedToday,
      final DateTime? lastCompletedAt}) = _$HabitImpl;

  factory _Habit.fromJson(Map<String, dynamic> json) = _$HabitImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  bool get isCompletedToday;
  @override
  DateTime? get lastCompletedAt;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitImplCopyWith<_$HabitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Area _$AreaFromJson(Map<String, dynamic> json) {
  return _Area.fromJson(json);
}

/// @nodoc
mixin _$Area {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  Metrics get metrics => throw _privateConstructorUsedError;
  List<Habit> get habits => throw _privateConstructorUsedError;
  List<String> get linkedProjectIds => throw _privateConstructorUsedError;
  List<String> get linkedResourceIds => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Area to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Area
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AreaCopyWith<Area> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreaCopyWith<$Res> {
  factory $AreaCopyWith(Area value, $Res Function(Area) then) =
      _$AreaCopyWithImpl<$Res, Area>;
  @useResult
  $Res call(
      {String id,
      String title,
      String icon,
      String description,
      String category,
      Metrics metrics,
      List<Habit> habits,
      List<String> linkedProjectIds,
      List<String> linkedResourceIds,
      DateTime createdAt,
      DateTime updatedAt});

  $MetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class _$AreaCopyWithImpl<$Res, $Val extends Area>
    implements $AreaCopyWith<$Res> {
  _$AreaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Area
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? icon = null,
    Object? description = null,
    Object? category = null,
    Object? metrics = null,
    Object? habits = null,
    Object? linkedProjectIds = null,
    Object? linkedResourceIds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as Metrics,
      habits: null == habits
          ? _value.habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<Habit>,
      linkedProjectIds: null == linkedProjectIds
          ? _value.linkedProjectIds
          : linkedProjectIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      linkedResourceIds: null == linkedResourceIds
          ? _value.linkedResourceIds
          : linkedResourceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of Area
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetricsCopyWith<$Res> get metrics {
    return $MetricsCopyWith<$Res>(_value.metrics, (value) {
      return _then(_value.copyWith(metrics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AreaImplCopyWith<$Res> implements $AreaCopyWith<$Res> {
  factory _$$AreaImplCopyWith(
          _$AreaImpl value, $Res Function(_$AreaImpl) then) =
      __$$AreaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String icon,
      String description,
      String category,
      Metrics metrics,
      List<Habit> habits,
      List<String> linkedProjectIds,
      List<String> linkedResourceIds,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $MetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class __$$AreaImplCopyWithImpl<$Res>
    extends _$AreaCopyWithImpl<$Res, _$AreaImpl>
    implements _$$AreaImplCopyWith<$Res> {
  __$$AreaImplCopyWithImpl(_$AreaImpl _value, $Res Function(_$AreaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Area
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? icon = null,
    Object? description = null,
    Object? category = null,
    Object? metrics = null,
    Object? habits = null,
    Object? linkedProjectIds = null,
    Object? linkedResourceIds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$AreaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as Metrics,
      habits: null == habits
          ? _value._habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<Habit>,
      linkedProjectIds: null == linkedProjectIds
          ? _value._linkedProjectIds
          : linkedProjectIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      linkedResourceIds: null == linkedResourceIds
          ? _value._linkedResourceIds
          : linkedResourceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AreaImpl implements _Area {
  const _$AreaImpl(
      {required this.id,
      required this.title,
      required this.icon,
      required this.description,
      required this.category,
      required this.metrics,
      final List<Habit> habits = const [],
      final List<String> linkedProjectIds = const [],
      final List<String> linkedResourceIds = const [],
      required this.createdAt,
      required this.updatedAt})
      : _habits = habits,
        _linkedProjectIds = linkedProjectIds,
        _linkedResourceIds = linkedResourceIds;

  factory _$AreaImpl.fromJson(Map<String, dynamic> json) =>
      _$$AreaImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String icon;
  @override
  final String description;
  @override
  final String category;
  @override
  final Metrics metrics;
  final List<Habit> _habits;
  @override
  @JsonKey()
  List<Habit> get habits {
    if (_habits is EqualUnmodifiableListView) return _habits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habits);
  }

  final List<String> _linkedProjectIds;
  @override
  @JsonKey()
  List<String> get linkedProjectIds {
    if (_linkedProjectIds is EqualUnmodifiableListView)
      return _linkedProjectIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_linkedProjectIds);
  }

  final List<String> _linkedResourceIds;
  @override
  @JsonKey()
  List<String> get linkedResourceIds {
    if (_linkedResourceIds is EqualUnmodifiableListView)
      return _linkedResourceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_linkedResourceIds);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Area(id: $id, title: $title, icon: $icon, description: $description, category: $category, metrics: $metrics, habits: $habits, linkedProjectIds: $linkedProjectIds, linkedResourceIds: $linkedResourceIds, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AreaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.metrics, metrics) || other.metrics == metrics) &&
            const DeepCollectionEquality().equals(other._habits, _habits) &&
            const DeepCollectionEquality()
                .equals(other._linkedProjectIds, _linkedProjectIds) &&
            const DeepCollectionEquality()
                .equals(other._linkedResourceIds, _linkedResourceIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      icon,
      description,
      category,
      metrics,
      const DeepCollectionEquality().hash(_habits),
      const DeepCollectionEquality().hash(_linkedProjectIds),
      const DeepCollectionEquality().hash(_linkedResourceIds),
      createdAt,
      updatedAt);

  /// Create a copy of Area
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AreaImplCopyWith<_$AreaImpl> get copyWith =>
      __$$AreaImplCopyWithImpl<_$AreaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AreaImplToJson(
      this,
    );
  }
}

abstract class _Area implements Area {
  const factory _Area(
      {required final String id,
      required final String title,
      required final String icon,
      required final String description,
      required final String category,
      required final Metrics metrics,
      final List<Habit> habits,
      final List<String> linkedProjectIds,
      final List<String> linkedResourceIds,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$AreaImpl;

  factory _Area.fromJson(Map<String, dynamic> json) = _$AreaImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get icon;
  @override
  String get description;
  @override
  String get category;
  @override
  Metrics get metrics;
  @override
  List<Habit> get habits;
  @override
  List<String> get linkedProjectIds;
  @override
  List<String> get linkedResourceIds;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Area
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AreaImplCopyWith<_$AreaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
