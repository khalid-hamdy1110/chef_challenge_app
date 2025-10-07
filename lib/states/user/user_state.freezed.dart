// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserState {

 Difficulty? get cookingLevel; String? get name; List<Recipe> get favorites; List<RecipeHistory> get history; bool get showOnboarding;
/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStateCopyWith<UserState> get copyWith => _$UserStateCopyWithImpl<UserState>(this as UserState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserState&&(identical(other.cookingLevel, cookingLevel) || other.cookingLevel == cookingLevel)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.favorites, favorites)&&const DeepCollectionEquality().equals(other.history, history)&&(identical(other.showOnboarding, showOnboarding) || other.showOnboarding == showOnboarding));
}


@override
int get hashCode => Object.hash(runtimeType,cookingLevel,name,const DeepCollectionEquality().hash(favorites),const DeepCollectionEquality().hash(history),showOnboarding);

@override
String toString() {
  return 'UserState(cookingLevel: $cookingLevel, name: $name, favorites: $favorites, history: $history, showOnboarding: $showOnboarding)';
}


}

/// @nodoc
abstract mixin class $UserStateCopyWith<$Res>  {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) _then) = _$UserStateCopyWithImpl;
@useResult
$Res call({
 Difficulty? cookingLevel, String? name, List<Recipe> favorites, List<RecipeHistory> history, bool showOnboarding
});




}
/// @nodoc
class _$UserStateCopyWithImpl<$Res>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._self, this._then);

  final UserState _self;
  final $Res Function(UserState) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cookingLevel = freezed,Object? name = freezed,Object? favorites = null,Object? history = null,Object? showOnboarding = null,}) {
  return _then(_self.copyWith(
cookingLevel: freezed == cookingLevel ? _self.cookingLevel : cookingLevel // ignore: cast_nullable_to_non_nullable
as Difficulty?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,favorites: null == favorites ? _self.favorites : favorites // ignore: cast_nullable_to_non_nullable
as List<Recipe>,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<RecipeHistory>,showOnboarding: null == showOnboarding ? _self.showOnboarding : showOnboarding // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserState].
extension UserStatePatterns on UserState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserState value)  $default,){
final _that = this;
switch (_that) {
case _UserState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserState value)?  $default,){
final _that = this;
switch (_that) {
case _UserState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Difficulty? cookingLevel,  String? name,  List<Recipe> favorites,  List<RecipeHistory> history,  bool showOnboarding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserState() when $default != null:
return $default(_that.cookingLevel,_that.name,_that.favorites,_that.history,_that.showOnboarding);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Difficulty? cookingLevel,  String? name,  List<Recipe> favorites,  List<RecipeHistory> history,  bool showOnboarding)  $default,) {final _that = this;
switch (_that) {
case _UserState():
return $default(_that.cookingLevel,_that.name,_that.favorites,_that.history,_that.showOnboarding);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Difficulty? cookingLevel,  String? name,  List<Recipe> favorites,  List<RecipeHistory> history,  bool showOnboarding)?  $default,) {final _that = this;
switch (_that) {
case _UserState() when $default != null:
return $default(_that.cookingLevel,_that.name,_that.favorites,_that.history,_that.showOnboarding);case _:
  return null;

}
}

}

/// @nodoc


class _UserState implements UserState {
  const _UserState({required this.cookingLevel, required this.name, required final  List<Recipe> favorites, required final  List<RecipeHistory> history, required this.showOnboarding}): _favorites = favorites,_history = history;
  

@override final  Difficulty? cookingLevel;
@override final  String? name;
 final  List<Recipe> _favorites;
@override List<Recipe> get favorites {
  if (_favorites is EqualUnmodifiableListView) return _favorites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favorites);
}

 final  List<RecipeHistory> _history;
@override List<RecipeHistory> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

@override final  bool showOnboarding;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStateCopyWith<_UserState> get copyWith => __$UserStateCopyWithImpl<_UserState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserState&&(identical(other.cookingLevel, cookingLevel) || other.cookingLevel == cookingLevel)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._favorites, _favorites)&&const DeepCollectionEquality().equals(other._history, _history)&&(identical(other.showOnboarding, showOnboarding) || other.showOnboarding == showOnboarding));
}


@override
int get hashCode => Object.hash(runtimeType,cookingLevel,name,const DeepCollectionEquality().hash(_favorites),const DeepCollectionEquality().hash(_history),showOnboarding);

@override
String toString() {
  return 'UserState(cookingLevel: $cookingLevel, name: $name, favorites: $favorites, history: $history, showOnboarding: $showOnboarding)';
}


}

/// @nodoc
abstract mixin class _$UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$UserStateCopyWith(_UserState value, $Res Function(_UserState) _then) = __$UserStateCopyWithImpl;
@override @useResult
$Res call({
 Difficulty? cookingLevel, String? name, List<Recipe> favorites, List<RecipeHistory> history, bool showOnboarding
});




}
/// @nodoc
class __$UserStateCopyWithImpl<$Res>
    implements _$UserStateCopyWith<$Res> {
  __$UserStateCopyWithImpl(this._self, this._then);

  final _UserState _self;
  final $Res Function(_UserState) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cookingLevel = freezed,Object? name = freezed,Object? favorites = null,Object? history = null,Object? showOnboarding = null,}) {
  return _then(_UserState(
cookingLevel: freezed == cookingLevel ? _self.cookingLevel : cookingLevel // ignore: cast_nullable_to_non_nullable
as Difficulty?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,favorites: null == favorites ? _self._favorites : favorites // ignore: cast_nullable_to_non_nullable
as List<Recipe>,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<RecipeHistory>,showOnboarding: null == showOnboarding ? _self.showOnboarding : showOnboarding // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
