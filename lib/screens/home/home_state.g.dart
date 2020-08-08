// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeState _$_$_HomeStateFromJson(Map<String, dynamic> json) {
  return _$_HomeState(
    posts: (json['posts'] as List)
            ?.map((e) => e == null
                ? null
                : List$Query$Post.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_HomeStateToJson(_$_HomeState instance) =>
    <String, dynamic>{
      'posts': instance.posts,
    };
