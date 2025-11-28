// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return _Resource.fromJson(json);
}

/// @nodoc
mixin _$Resource {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  ResourceType get type => throw _privateConstructorUsedError;
  String get content =>
      throw _privateConstructorUsedError; // URL or text content
  String? get thumbnail => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<String> get linkedProjectIds => throw _privateConstructorUsedError;
  List<String> get linkedAreaIds => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get accessedAt => throw _privateConstructorUsedError;

  /// Serializes this Resource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResourceCopyWith<Resource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceCopyWith<$Res> {
  factory $ResourceCopyWith(Resource value, $Res Function(Resource) then) =
      _$ResourceCopyWithImpl<$Res, Resource>;
  @useResult
  $Res call(
      {String id,
      String title,
      ResourceType type,
      String content,
      String? thumbnail,
      List<String> tags,
      List<String> linkedProjectIds,
      List<String> linkedAreaIds,
      bool isFavorite,
      DateTime createdAt,
      DateTime accessedAt});
}

/// @nodoc
class _$ResourceCopyWithImpl<$Res, $Val extends Resource>
    implements $ResourceCopyWith<$Res> {
  _$ResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? content = null,
    Object? thumbnail = freezed,
    Object? tags = null,
    Object? linkedProjectIds = null,
    Object? linkedAreaIds = null,
    Object? isFavorite = null,
    Object? createdAt = null,
    Object? accessedAt = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResourceType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      linkedProjectIds: null == linkedProjectIds
          ? _value.linkedProjectIds
          : linkedProjectIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      linkedAreaIds: null == linkedAreaIds
          ? _value.linkedAreaIds
          : linkedAreaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      accessedAt: null == accessedAt
          ? _value.accessedAt
          : accessedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResourceImplCopyWith<$Res>
    implements $ResourceCopyWith<$Res> {
  factory _$$ResourceImplCopyWith(
          _$ResourceImpl value, $Res Function(_$ResourceImpl) then) =
      __$$ResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      ResourceType type,
      String content,
      String? thumbnail,
      List<String> tags,
      List<String> linkedProjectIds,
      List<String> linkedAreaIds,
      bool isFavorite,
      DateTime createdAt,
      DateTime accessedAt});
}

/// @nodoc
class __$$ResourceImplCopyWithImpl<$Res>
    extends _$ResourceCopyWithImpl<$Res, _$ResourceImpl>
    implements _$$ResourceImplCopyWith<$Res> {
  __$$ResourceImplCopyWithImpl(
      _$ResourceImpl _value, $Res Function(_$ResourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? content = null,
    Object? thumbnail = freezed,
    Object? tags = null,
    Object? linkedProjectIds = null,
    Object? linkedAreaIds = null,
    Object? isFavorite = null,
    Object? createdAt = null,
    Object? accessedAt = null,
  }) {
    return _then(_$ResourceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResourceType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      linkedProjectIds: null == linkedProjectIds
          ? _value._linkedProjectIds
          : linkedProjectIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      linkedAreaIds: null == linkedAreaIds
          ? _value._linkedAreaIds
          : linkedAreaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      accessedAt: null == accessedAt
          ? _value.accessedAt
          : accessedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResourceImpl implements _Resource {
  const _$ResourceImpl(
      {required this.id,
      required this.title,
      required this.type,
      required this.content,
      this.thumbnail,
      final List<String> tags = const [],
      final List<String> linkedProjectIds = const [],
      final List<String> linkedAreaIds = const [],
      this.isFavorite = false,
      required this.createdAt,
      required this.accessedAt})
      : _tags = tags,
        _linkedProjectIds = linkedProjectIds,
        _linkedAreaIds = linkedAreaIds;

  factory _$ResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResourceImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final ResourceType type;
  @override
  final String content;
// URL or text content
  @override
  final String? thumbnail;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
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

  final List<String> _linkedAreaIds;
  @override
  @JsonKey()
  List<String> get linkedAreaIds {
    if (_linkedAreaIds is EqualUnmodifiableListView) return _linkedAreaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_linkedAreaIds);
  }

  @override
  @JsonKey()
  final bool isFavorite;
  @override
  final DateTime createdAt;
  @override
  final DateTime accessedAt;

  @override
  String toString() {
    return 'Resource(id: $id, title: $title, type: $type, content: $content, thumbnail: $thumbnail, tags: $tags, linkedProjectIds: $linkedProjectIds, linkedAreaIds: $linkedAreaIds, isFavorite: $isFavorite, createdAt: $createdAt, accessedAt: $accessedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._linkedProjectIds, _linkedProjectIds) &&
            const DeepCollectionEquality()
                .equals(other._linkedAreaIds, _linkedAreaIds) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.accessedAt, accessedAt) ||
                other.accessedAt == accessedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      type,
      content,
      thumbnail,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_linkedProjectIds),
      const DeepCollectionEquality().hash(_linkedAreaIds),
      isFavorite,
      createdAt,
      accessedAt);

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceImplCopyWith<_$ResourceImpl> get copyWith =>
      __$$ResourceImplCopyWithImpl<_$ResourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResourceImplToJson(
      this,
    );
  }
}

abstract class _Resource implements Resource {
  const factory _Resource(
      {required final String id,
      required final String title,
      required final ResourceType type,
      required final String content,
      final String? thumbnail,
      final List<String> tags,
      final List<String> linkedProjectIds,
      final List<String> linkedAreaIds,
      final bool isFavorite,
      required final DateTime createdAt,
      required final DateTime accessedAt}) = _$ResourceImpl;

  factory _Resource.fromJson(Map<String, dynamic> json) =
      _$ResourceImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  ResourceType get type;
  @override
  String get content; // URL or text content
  @override
  String? get thumbnail;
  @override
  List<String> get tags;
  @override
  List<String> get linkedProjectIds;
  @override
  List<String> get linkedAreaIds;
  @override
  bool get isFavorite;
  @override
  DateTime get createdAt;
  @override
  DateTime get accessedAt;

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResourceImplCopyWith<_$ResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
