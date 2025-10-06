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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreState()';
}


}

/// @nodoc
class $ExploreStateCopyWith<$Res>  {
$ExploreStateCopyWith(ExploreState _, $Res Function(ExploreState) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExploreInitial value)?  initial,TResult Function( ExploreLoading value)?  loading,TResult Function( ExploreSuccess value)?  success,TResult Function( ExploreFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExploreInitial() when initial != null:
return initial(_that);case ExploreLoading() when loading != null:
return loading(_that);case ExploreSuccess() when success != null:
return success(_that);case ExploreFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExploreInitial value)  initial,required TResult Function( ExploreLoading value)  loading,required TResult Function( ExploreSuccess value)  success,required TResult Function( ExploreFailure value)  failure,}){
final _that = this;
switch (_that) {
case ExploreInitial():
return initial(_that);case ExploreLoading():
return loading(_that);case ExploreSuccess():
return success(_that);case ExploreFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExploreInitial value)?  initial,TResult? Function( ExploreLoading value)?  loading,TResult? Function( ExploreSuccess value)?  success,TResult? Function( ExploreFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ExploreInitial() when initial != null:
return initial(_that);case ExploreLoading() when loading != null:
return loading(_that);case ExploreSuccess() when success != null:
return success(_that);case ExploreFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Recipe> recipes,  List<Recipe> filteredRecipes,  List<String> allTags,  Recipe? recipeOfTheDay,  bool listView,  List<String> selectedTags)?  success,TResult Function( ApiError error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExploreInitial() when initial != null:
return initial();case ExploreLoading() when loading != null:
return loading();case ExploreSuccess() when success != null:
return success(_that.recipes,_that.filteredRecipes,_that.allTags,_that.recipeOfTheDay,_that.listView,_that.selectedTags);case ExploreFailure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Recipe> recipes,  List<Recipe> filteredRecipes,  List<String> allTags,  Recipe? recipeOfTheDay,  bool listView,  List<String> selectedTags)  success,required TResult Function( ApiError error)  failure,}) {final _that = this;
switch (_that) {
case ExploreInitial():
return initial();case ExploreLoading():
return loading();case ExploreSuccess():
return success(_that.recipes,_that.filteredRecipes,_that.allTags,_that.recipeOfTheDay,_that.listView,_that.selectedTags);case ExploreFailure():
return failure(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Recipe> recipes,  List<Recipe> filteredRecipes,  List<String> allTags,  Recipe? recipeOfTheDay,  bool listView,  List<String> selectedTags)?  success,TResult? Function( ApiError error)?  failure,}) {final _that = this;
switch (_that) {
case ExploreInitial() when initial != null:
return initial();case ExploreLoading() when loading != null:
return loading();case ExploreSuccess() when success != null:
return success(_that.recipes,_that.filteredRecipes,_that.allTags,_that.recipeOfTheDay,_that.listView,_that.selectedTags);case ExploreFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ExploreInitial implements ExploreState {
  const ExploreInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreState.initial()';
}


}




/// @nodoc


class ExploreLoading implements ExploreState {
  const ExploreLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreState.loading()';
}


}




/// @nodoc


class ExploreSuccess implements ExploreState {
  const ExploreSuccess({required final  List<Recipe> recipes, required final  List<Recipe> filteredRecipes, required final  List<String> allTags, this.recipeOfTheDay, this.listView = true, final  List<String> selectedTags = const <String>[]}): _recipes = recipes,_filteredRecipes = filteredRecipes,_allTags = allTags,_selectedTags = selectedTags;
  

 final  List<Recipe> _recipes;
 List<Recipe> get recipes {
  if (_recipes is EqualUnmodifiableListView) return _recipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipes);
}

 final  List<Recipe> _filteredRecipes;
 List<Recipe> get filteredRecipes {
  if (_filteredRecipes is EqualUnmodifiableListView) return _filteredRecipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredRecipes);
}

 final  List<String> _allTags;
 List<String> get allTags {
  if (_allTags is EqualUnmodifiableListView) return _allTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allTags);
}

 final  Recipe? recipeOfTheDay;
@JsonKey() final  bool listView;
 final  List<String> _selectedTags;
@JsonKey() List<String> get selectedTags {
  if (_selectedTags is EqualUnmodifiableListView) return _selectedTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedTags);
}


/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreSuccessCopyWith<ExploreSuccess> get copyWith => _$ExploreSuccessCopyWithImpl<ExploreSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreSuccess&&const DeepCollectionEquality().equals(other._recipes, _recipes)&&const DeepCollectionEquality().equals(other._filteredRecipes, _filteredRecipes)&&const DeepCollectionEquality().equals(other._allTags, _allTags)&&(identical(other.recipeOfTheDay, recipeOfTheDay) || other.recipeOfTheDay == recipeOfTheDay)&&(identical(other.listView, listView) || other.listView == listView)&&const DeepCollectionEquality().equals(other._selectedTags, _selectedTags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recipes),const DeepCollectionEquality().hash(_filteredRecipes),const DeepCollectionEquality().hash(_allTags),recipeOfTheDay,listView,const DeepCollectionEquality().hash(_selectedTags));

@override
String toString() {
  return 'ExploreState.success(recipes: $recipes, filteredRecipes: $filteredRecipes, allTags: $allTags, recipeOfTheDay: $recipeOfTheDay, listView: $listView, selectedTags: $selectedTags)';
}


}

/// @nodoc
abstract mixin class $ExploreSuccessCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory $ExploreSuccessCopyWith(ExploreSuccess value, $Res Function(ExploreSuccess) _then) = _$ExploreSuccessCopyWithImpl;
@useResult
$Res call({
 List<Recipe> recipes, List<Recipe> filteredRecipes, List<String> allTags, Recipe? recipeOfTheDay, bool listView, List<String> selectedTags
});


$RecipeCopyWith<$Res>? get recipeOfTheDay;

}
/// @nodoc
class _$ExploreSuccessCopyWithImpl<$Res>
    implements $ExploreSuccessCopyWith<$Res> {
  _$ExploreSuccessCopyWithImpl(this._self, this._then);

  final ExploreSuccess _self;
  final $Res Function(ExploreSuccess) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? recipes = null,Object? filteredRecipes = null,Object? allTags = null,Object? recipeOfTheDay = freezed,Object? listView = null,Object? selectedTags = null,}) {
  return _then(ExploreSuccess(
recipes: null == recipes ? _self._recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,filteredRecipes: null == filteredRecipes ? _self._filteredRecipes : filteredRecipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,allTags: null == allTags ? _self._allTags : allTags // ignore: cast_nullable_to_non_nullable
as List<String>,recipeOfTheDay: freezed == recipeOfTheDay ? _self.recipeOfTheDay : recipeOfTheDay // ignore: cast_nullable_to_non_nullable
as Recipe?,listView: null == listView ? _self.listView : listView // ignore: cast_nullable_to_non_nullable
as bool,selectedTags: null == selectedTags ? _self._selectedTags : selectedTags // ignore: cast_nullable_to_non_nullable
as List<String>,
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

/// @nodoc


class ExploreFailure implements ExploreState {
  const ExploreFailure({required this.error});
  

 final  ApiError error;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreFailureCopyWith<ExploreFailure> get copyWith => _$ExploreFailureCopyWithImpl<ExploreFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ExploreState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $ExploreFailureCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory $ExploreFailureCopyWith(ExploreFailure value, $Res Function(ExploreFailure) _then) = _$ExploreFailureCopyWithImpl;
@useResult
$Res call({
 ApiError error
});




}
/// @nodoc
class _$ExploreFailureCopyWithImpl<$Res>
    implements $ExploreFailureCopyWith<$Res> {
  _$ExploreFailureCopyWithImpl(this._self, this._then);

  final ExploreFailure _self;
  final $Res Function(ExploreFailure) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ExploreFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiError,
  ));
}


}

// dart format on
