// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExploreState {

 Recipe? get recipeOfTheDay; bool get listView; List<Recipe> get recipes; List<Recipe> get filteredRecipe; List<Tag> get selectedTags;
/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreStateCopyWith<ExploreState> get copyWith => _$ExploreStateCopyWithImpl<ExploreState>(this as ExploreState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreState&&(identical(other.recipeOfTheDay, recipeOfTheDay) || other.recipeOfTheDay == recipeOfTheDay)&&(identical(other.listView, listView) || other.listView == listView)&&const DeepCollectionEquality().equals(other.recipes, recipes)&&const DeepCollectionEquality().equals(other.filteredRecipe, filteredRecipe)&&const DeepCollectionEquality().equals(other.selectedTags, selectedTags));
}


@override
int get hashCode => Object.hash(runtimeType,recipeOfTheDay,listView,const DeepCollectionEquality().hash(recipes),const DeepCollectionEquality().hash(filteredRecipe),const DeepCollectionEquality().hash(selectedTags));

@override
String toString() {
  return 'ExploreState(recipeOfTheDay: $recipeOfTheDay, listView: $listView, recipes: $recipes, filteredRecipe: $filteredRecipe, selectedTags: $selectedTags)';
}


}

/// @nodoc
abstract mixin class $ExploreStateCopyWith<$Res>  {
  factory $ExploreStateCopyWith(ExploreState value, $Res Function(ExploreState) _then) = _$ExploreStateCopyWithImpl;
@useResult
$Res call({
 Recipe? recipeOfTheDay, bool listView, List<Recipe> recipes, List<Recipe> filteredRecipe, List<Tag> selectedTags
});


$RecipeCopyWith<$Res>? get recipeOfTheDay;

}
/// @nodoc
class _$ExploreStateCopyWithImpl<$Res>
    implements $ExploreStateCopyWith<$Res> {
  _$ExploreStateCopyWithImpl(this._self, this._then);

  final ExploreState _self;
  final $Res Function(ExploreState) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipeOfTheDay = freezed,Object? listView = null,Object? recipes = null,Object? filteredRecipe = null,Object? selectedTags = null,}) {
  return _then(_self.copyWith(
recipeOfTheDay: freezed == recipeOfTheDay ? _self.recipeOfTheDay : recipeOfTheDay // ignore: cast_nullable_to_non_nullable
as Recipe?,listView: null == listView ? _self.listView : listView // ignore: cast_nullable_to_non_nullable
as bool,recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,filteredRecipe: null == filteredRecipe ? _self.filteredRecipe : filteredRecipe // ignore: cast_nullable_to_non_nullable
as List<Recipe>,selectedTags: null == selectedTags ? _self.selectedTags : selectedTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,
  ));
}
/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res>? get recipeOfTheDay {
    if (_self.recipeOfTheDay == null) {
    return null;
  }

  return $RecipeCopyWith<$Res>(_self.recipeOfTheDay!, (value) {
    return _then(_self.copyWith(recipeOfTheDay: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExploreState].
extension ExploreStatePatterns on ExploreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExploreState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExploreState value)  $default,){
final _that = this;
switch (_that) {
case _ExploreState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExploreState value)?  $default,){
final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Recipe? recipeOfTheDay,  bool listView,  List<Recipe> recipes,  List<Recipe> filteredRecipe,  List<Tag> selectedTags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
return $default(_that.recipeOfTheDay,_that.listView,_that.recipes,_that.filteredRecipe,_that.selectedTags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Recipe? recipeOfTheDay,  bool listView,  List<Recipe> recipes,  List<Recipe> filteredRecipe,  List<Tag> selectedTags)  $default,) {final _that = this;
switch (_that) {
case _ExploreState():
return $default(_that.recipeOfTheDay,_that.listView,_that.recipes,_that.filteredRecipe,_that.selectedTags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Recipe? recipeOfTheDay,  bool listView,  List<Recipe> recipes,  List<Recipe> filteredRecipe,  List<Tag> selectedTags)?  $default,) {final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
return $default(_that.recipeOfTheDay,_that.listView,_that.recipes,_that.filteredRecipe,_that.selectedTags);case _:
  return null;

}
}

}

/// @nodoc


class _ExploreState implements ExploreState {
  const _ExploreState({required this.recipeOfTheDay, required this.listView, required final  List<Recipe> recipes, required final  List<Recipe> filteredRecipe, required final  List<Tag> selectedTags}): _recipes = recipes,_filteredRecipe = filteredRecipe,_selectedTags = selectedTags;
  

@override final  Recipe? recipeOfTheDay;
@override final  bool listView;
 final  List<Recipe> _recipes;
@override List<Recipe> get recipes {
  if (_recipes is EqualUnmodifiableListView) return _recipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipes);
}

 final  List<Recipe> _filteredRecipe;
@override List<Recipe> get filteredRecipe {
  if (_filteredRecipe is EqualUnmodifiableListView) return _filteredRecipe;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredRecipe);
}

 final  List<Tag> _selectedTags;
@override List<Tag> get selectedTags {
  if (_selectedTags is EqualUnmodifiableListView) return _selectedTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedTags);
}


/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExploreStateCopyWith<_ExploreState> get copyWith => __$ExploreStateCopyWithImpl<_ExploreState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExploreState&&(identical(other.recipeOfTheDay, recipeOfTheDay) || other.recipeOfTheDay == recipeOfTheDay)&&(identical(other.listView, listView) || other.listView == listView)&&const DeepCollectionEquality().equals(other._recipes, _recipes)&&const DeepCollectionEquality().equals(other._filteredRecipe, _filteredRecipe)&&const DeepCollectionEquality().equals(other._selectedTags, _selectedTags));
}


@override
int get hashCode => Object.hash(runtimeType,recipeOfTheDay,listView,const DeepCollectionEquality().hash(_recipes),const DeepCollectionEquality().hash(_filteredRecipe),const DeepCollectionEquality().hash(_selectedTags));

@override
String toString() {
  return 'ExploreState(recipeOfTheDay: $recipeOfTheDay, listView: $listView, recipes: $recipes, filteredRecipe: $filteredRecipe, selectedTags: $selectedTags)';
}


}

/// @nodoc
abstract mixin class _$ExploreStateCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory _$ExploreStateCopyWith(_ExploreState value, $Res Function(_ExploreState) _then) = __$ExploreStateCopyWithImpl;
@override @useResult
$Res call({
 Recipe? recipeOfTheDay, bool listView, List<Recipe> recipes, List<Recipe> filteredRecipe, List<Tag> selectedTags
});


@override $RecipeCopyWith<$Res>? get recipeOfTheDay;

}
/// @nodoc
class __$ExploreStateCopyWithImpl<$Res>
    implements _$ExploreStateCopyWith<$Res> {
  __$ExploreStateCopyWithImpl(this._self, this._then);

  final _ExploreState _self;
  final $Res Function(_ExploreState) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipeOfTheDay = freezed,Object? listView = null,Object? recipes = null,Object? filteredRecipe = null,Object? selectedTags = null,}) {
  return _then(_ExploreState(
recipeOfTheDay: freezed == recipeOfTheDay ? _self.recipeOfTheDay : recipeOfTheDay // ignore: cast_nullable_to_non_nullable
as Recipe?,listView: null == listView ? _self.listView : listView // ignore: cast_nullable_to_non_nullable
as bool,recipes: null == recipes ? _self._recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,filteredRecipe: null == filteredRecipe ? _self._filteredRecipe : filteredRecipe // ignore: cast_nullable_to_non_nullable
as List<Recipe>,selectedTags: null == selectedTags ? _self._selectedTags : selectedTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,
  ));
}

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res>? get recipeOfTheDay {
    if (_self.recipeOfTheDay == null) {
    return null;
  }

  return $RecipeCopyWith<$Res>(_self.recipeOfTheDay!, (value) {
    return _then(_self.copyWith(recipeOfTheDay: value));
  });
}
}

// dart format on
