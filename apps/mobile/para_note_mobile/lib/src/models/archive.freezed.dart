// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Retrospective _$RetrospectiveFromJson(Map<String, dynamic> json) {
  return _Retrospective.fromJson(json);
}

/// @nodoc
mixin _$Retrospective {
  List<String> get whatWentWell => throw _privateConstructorUsedError;
  List<String> get whatToImprove => throw _privateConstructorUsedError;
  List<String> get lessonsLearned => throw _privateConstructorUsedError;

  /// Serializes this Retrospective to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Retrospective
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RetrospectiveCopyWith<Retrospective> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetrospectiveCopyWith<$Res> {
  factory $RetrospectiveCopyWith(
          Retrospective value, $Res Function(Retrospective) then) =
      _$RetrospectiveCopyWithImpl<$Res, Retrospective>;
  @useResult
  $Res call(
      {List<String> whatWentWell,
      List<String> whatToImprove,
      List<String> lessonsLearned});
}

/// @nodoc
class _$RetrospectiveCopyWithImpl<$Res, $Val extends Retrospective>
    implements $RetrospectiveCopyWith<$Res> {
  _$RetrospectiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Retrospective
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? whatWentWell = null,
    Object? whatToImprove = null,
    Object? lessonsLearned = null,
  }) {
    return _then(_value.copyWith(
      whatWentWell: null == whatWentWell
          ? _value.whatWentWell
          : whatWentWell // ignore: cast_nullable_to_non_nullable
              as List<String>,
      whatToImprove: null == whatToImprove
          ? _value.whatToImprove
          : whatToImprove // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lessonsLearned: null == lessonsLearned
          ? _value.lessonsLearned
          : lessonsLearned // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RetrospectiveImplCopyWith<$Res>
    implements $RetrospectiveCopyWith<$Res> {
  factory _$$RetrospectiveImplCopyWith(
          _$RetrospectiveImpl value, $Res Function(_$RetrospectiveImpl) then) =
      __$$RetrospectiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> whatWentWell,
      List<String> whatToImprove,
      List<String> lessonsLearned});
}

/// @nodoc
class __$$RetrospectiveImplCopyWithImpl<$Res>
    extends _$RetrospectiveCopyWithImpl<$Res, _$RetrospectiveImpl>
    implements _$$RetrospectiveImplCopyWith<$Res> {
  __$$RetrospectiveImplCopyWithImpl(
      _$RetrospectiveImpl _value, $Res Function(_$RetrospectiveImpl) _then)
      : super(_value, _then);

  /// Create a copy of Retrospective
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? whatWentWell = null,
    Object? whatToImprove = null,
    Object? lessonsLearned = null,
  }) {
    return _then(_$RetrospectiveImpl(
      whatWentWell: null == whatWentWell
          ? _value._whatWentWell
          : whatWentWell // ignore: cast_nullable_to_non_nullable
              as List<String>,
      whatToImprove: null == whatToImprove
          ? _value._whatToImprove
          : whatToImprove // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lessonsLearned: null == lessonsLearned
          ? _value._lessonsLearned
          : lessonsLearned // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RetrospectiveImpl implements _Retrospective {
  const _$RetrospectiveImpl(
      {final List<String> whatWentWell = const [],
      final List<String> whatToImprove = const [],
      final List<String> lessonsLearned = const []})
      : _whatWentWell = whatWentWell,
        _whatToImprove = whatToImprove,
        _lessonsLearned = lessonsLearned;

  factory _$RetrospectiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$RetrospectiveImplFromJson(json);

  final List<String> _whatWentWell;
  @override
  @JsonKey()
  List<String> get whatWentWell {
    if (_whatWentWell is EqualUnmodifiableListView) return _whatWentWell;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_whatWentWell);
  }

  final List<String> _whatToImprove;
  @override
  @JsonKey()
  List<String> get whatToImprove {
    if (_whatToImprove is EqualUnmodifiableListView) return _whatToImprove;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_whatToImprove);
  }

  final List<String> _lessonsLearned;
  @override
  @JsonKey()
  List<String> get lessonsLearned {
    if (_lessonsLearned is EqualUnmodifiableListView) return _lessonsLearned;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessonsLearned);
  }

  @override
  String toString() {
    return 'Retrospective(whatWentWell: $whatWentWell, whatToImprove: $whatToImprove, lessonsLearned: $lessonsLearned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RetrospectiveImpl &&
            const DeepCollectionEquality()
                .equals(other._whatWentWell, _whatWentWell) &&
            const DeepCollectionEquality()
                .equals(other._whatToImprove, _whatToImprove) &&
            const DeepCollectionEquality()
                .equals(other._lessonsLearned, _lessonsLearned));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_whatWentWell),
      const DeepCollectionEquality().hash(_whatToImprove),
      const DeepCollectionEquality().hash(_lessonsLearned));

  /// Create a copy of Retrospective
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RetrospectiveImplCopyWith<_$RetrospectiveImpl> get copyWith =>
      __$$RetrospectiveImplCopyWithImpl<_$RetrospectiveImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RetrospectiveImplToJson(
      this,
    );
  }
}

abstract class _Retrospective implements Retrospective {
  const factory _Retrospective(
      {final List<String> whatWentWell,
      final List<String> whatToImprove,
      final List<String> lessonsLearned}) = _$RetrospectiveImpl;

  factory _Retrospective.fromJson(Map<String, dynamic> json) =
      _$RetrospectiveImpl.fromJson;

  @override
  List<String> get whatWentWell;
  @override
  List<String> get whatToImprove;
  @override
  List<String> get lessonsLearned;

  /// Create a copy of Retrospective
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RetrospectiveImplCopyWith<_$RetrospectiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Archive _$ArchiveFromJson(Map<String, dynamic> json) {
  return _Archive.fromJson(json);
}

/// @nodoc
mixin _$Archive {
  String get id => throw _privateConstructorUsedError;
  ArchiveType get originalType => throw _privateConstructorUsedError;
  String get originalId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get archivedAt => throw _privateConstructorUsedError;
  String? get completionNote => throw _privateConstructorUsedError;
  Retrospective? get retrospective => throw _privateConstructorUsedError;

  /// Serializes this Archive to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Archive
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArchiveCopyWith<Archive> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArchiveCopyWith<$Res> {
  factory $ArchiveCopyWith(Archive value, $Res Function(Archive) then) =
      _$ArchiveCopyWithImpl<$Res, Archive>;
  @useResult
  $Res call(
      {String id,
      ArchiveType originalType,
      String originalId,
      String title,
      String description,
      DateTime archivedAt,
      String? completionNote,
      Retrospective? retrospective});

  $RetrospectiveCopyWith<$Res>? get retrospective;
}

/// @nodoc
class _$ArchiveCopyWithImpl<$Res, $Val extends Archive>
    implements $ArchiveCopyWith<$Res> {
  _$ArchiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Archive
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? originalType = null,
    Object? originalId = null,
    Object? title = null,
    Object? description = null,
    Object? archivedAt = null,
    Object? completionNote = freezed,
    Object? retrospective = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      originalType: null == originalType
          ? _value.originalType
          : originalType // ignore: cast_nullable_to_non_nullable
              as ArchiveType,
      originalId: null == originalId
          ? _value.originalId
          : originalId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      archivedAt: null == archivedAt
          ? _value.archivedAt
          : archivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completionNote: freezed == completionNote
          ? _value.completionNote
          : completionNote // ignore: cast_nullable_to_non_nullable
              as String?,
      retrospective: freezed == retrospective
          ? _value.retrospective
          : retrospective // ignore: cast_nullable_to_non_nullable
              as Retrospective?,
    ) as $Val);
  }

  /// Create a copy of Archive
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RetrospectiveCopyWith<$Res>? get retrospective {
    if (_value.retrospective == null) {
      return null;
    }

    return $RetrospectiveCopyWith<$Res>(_value.retrospective!, (value) {
      return _then(_value.copyWith(retrospective: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArchiveImplCopyWith<$Res> implements $ArchiveCopyWith<$Res> {
  factory _$$ArchiveImplCopyWith(
          _$ArchiveImpl value, $Res Function(_$ArchiveImpl) then) =
      __$$ArchiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ArchiveType originalType,
      String originalId,
      String title,
      String description,
      DateTime archivedAt,
      String? completionNote,
      Retrospective? retrospective});

  @override
  $RetrospectiveCopyWith<$Res>? get retrospective;
}

/// @nodoc
class __$$ArchiveImplCopyWithImpl<$Res>
    extends _$ArchiveCopyWithImpl<$Res, _$ArchiveImpl>
    implements _$$ArchiveImplCopyWith<$Res> {
  __$$ArchiveImplCopyWithImpl(
      _$ArchiveImpl _value, $Res Function(_$ArchiveImpl) _then)
      : super(_value, _then);

  /// Create a copy of Archive
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? originalType = null,
    Object? originalId = null,
    Object? title = null,
    Object? description = null,
    Object? archivedAt = null,
    Object? completionNote = freezed,
    Object? retrospective = freezed,
  }) {
    return _then(_$ArchiveImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      originalType: null == originalType
          ? _value.originalType
          : originalType // ignore: cast_nullable_to_non_nullable
              as ArchiveType,
      originalId: null == originalId
          ? _value.originalId
          : originalId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      archivedAt: null == archivedAt
          ? _value.archivedAt
          : archivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completionNote: freezed == completionNote
          ? _value.completionNote
          : completionNote // ignore: cast_nullable_to_non_nullable
              as String?,
      retrospective: freezed == retrospective
          ? _value.retrospective
          : retrospective // ignore: cast_nullable_to_non_nullable
              as Retrospective?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArchiveImpl implements _Archive {
  const _$ArchiveImpl(
      {required this.id,
      required this.originalType,
      required this.originalId,
      required this.title,
      required this.description,
      required this.archivedAt,
      this.completionNote,
      this.retrospective});

  factory _$ArchiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArchiveImplFromJson(json);

  @override
  final String id;
  @override
  final ArchiveType originalType;
  @override
  final String originalId;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime archivedAt;
  @override
  final String? completionNote;
  @override
  final Retrospective? retrospective;

  @override
  String toString() {
    return 'Archive(id: $id, originalType: $originalType, originalId: $originalId, title: $title, description: $description, archivedAt: $archivedAt, completionNote: $completionNote, retrospective: $retrospective)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArchiveImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.originalType, originalType) ||
                other.originalType == originalType) &&
            (identical(other.originalId, originalId) ||
                other.originalId == originalId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.archivedAt, archivedAt) ||
                other.archivedAt == archivedAt) &&
            (identical(other.completionNote, completionNote) ||
                other.completionNote == completionNote) &&
            (identical(other.retrospective, retrospective) ||
                other.retrospective == retrospective));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, originalType, originalId,
      title, description, archivedAt, completionNote, retrospective);

  /// Create a copy of Archive
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArchiveImplCopyWith<_$ArchiveImpl> get copyWith =>
      __$$ArchiveImplCopyWithImpl<_$ArchiveImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArchiveImplToJson(
      this,
    );
  }
}

abstract class _Archive implements Archive {
  const factory _Archive(
      {required final String id,
      required final ArchiveType originalType,
      required final String originalId,
      required final String title,
      required final String description,
      required final DateTime archivedAt,
      final String? completionNote,
      final Retrospective? retrospective}) = _$ArchiveImpl;

  factory _Archive.fromJson(Map<String, dynamic> json) = _$ArchiveImpl.fromJson;

  @override
  String get id;
  @override
  ArchiveType get originalType;
  @override
  String get originalId;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get archivedAt;
  @override
  String? get completionNote;
  @override
  Retrospective? get retrospective;

  /// Create a copy of Archive
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArchiveImplCopyWith<_$ArchiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
