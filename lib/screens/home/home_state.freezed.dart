// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
HomeState _$HomeStateFromJson(Map<String, dynamic> json) {
  return _HomeState.fromJson(json);
}

class _$HomeStateTearOff {
  const _$HomeStateTearOff();

// ignore: unused_element
  _HomeState call({List<List$Query$Post> posts = const []}) {
    return _HomeState(
      posts: posts,
    );
  }
}

// ignore: unused_element
const $HomeState = _$HomeStateTearOff();

mixin _$HomeState {
  List<List$Query$Post> get posts;

  Map<String, dynamic> toJson();
  $HomeStateCopyWith<HomeState> get copyWith;
}

abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call({List<List$Query$Post> posts});
}

class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object posts = freezed,
  }) {
    return _then(_value.copyWith(
      posts: posts == freezed ? _value.posts : posts as List<List$Query$Post>,
    ));
  }
}

abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call({List<List$Query$Post> posts});
}

class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object posts = freezed,
  }) {
    return _then(_HomeState(
      posts: posts == freezed ? _value.posts : posts as List<List$Query$Post>,
    ));
  }
}

@JsonSerializable()
class _$_HomeState with DiagnosticableTreeMixin implements _HomeState {
  const _$_HomeState({this.posts = const []}) : assert(posts != null);

  factory _$_HomeState.fromJson(Map<String, dynamic> json) =>
      _$_$_HomeStateFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<List$Query$Post> posts;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState(posts: $posts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState'))
      ..add(DiagnosticsProperty('posts', posts));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(posts);

  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HomeStateToJson(this);
  }
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({List<List$Query$Post> posts}) = _$_HomeState;

  factory _HomeState.fromJson(Map<String, dynamic> json) =
      _$_HomeState.fromJson;

  @override
  List<List$Query$Post> get posts;
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith;
}
