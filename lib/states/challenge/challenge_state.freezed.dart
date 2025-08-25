// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChallengeState {

 int get currentStepIndex; Duration get elapsedTime; Duration get totalElapsedTime; bool get isRunning; bool get isCompleted; List<SummaryStep> get stepsSummary;
/// Create a copy of ChallengeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeStateCopyWith<ChallengeState> get copyWith => _$ChallengeStateCopyWithImpl<ChallengeState>(this as ChallengeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeState&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex)&&(identical(other.elapsedTime, elapsedTime) || other.elapsedTime == elapsedTime)&&(identical(other.totalElapsedTime, totalElapsedTime) || other.totalElapsedTime == totalElapsedTime)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&const DeepCollectionEquality().equals(other.stepsSummary, stepsSummary));
}


@override
int get hashCode => Object.hash(runtimeType,currentStepIndex,elapsedTime,totalElapsedTime,isRunning,isCompleted,const DeepCollectionEquality().hash(stepsSummary));

@override
String toString() {
  return 'ChallengeState(currentStepIndex: $currentStepIndex, elapsedTime: $elapsedTime, totalElapsedTime: $totalElapsedTime, isRunning: $isRunning, isCompleted: $isCompleted, stepsSummary: $stepsSummary)';
}


}

/// @nodoc
abstract mixin class $ChallengeStateCopyWith<$Res>  {
  factory $ChallengeStateCopyWith(ChallengeState value, $Res Function(ChallengeState) _then) = _$ChallengeStateCopyWithImpl;
@useResult
$Res call({
 int currentStepIndex, Duration elapsedTime, Duration totalElapsedTime, bool isRunning, bool isCompleted, List<SummaryStep> stepsSummary
});




}
/// @nodoc
class _$ChallengeStateCopyWithImpl<$Res>
    implements $ChallengeStateCopyWith<$Res> {
  _$ChallengeStateCopyWithImpl(this._self, this._then);

  final ChallengeState _self;
  final $Res Function(ChallengeState) _then;

/// Create a copy of ChallengeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStepIndex = null,Object? elapsedTime = null,Object? totalElapsedTime = null,Object? isRunning = null,Object? isCompleted = null,Object? stepsSummary = null,}) {
  return _then(_self.copyWith(
currentStepIndex: null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
as int,elapsedTime: null == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as Duration,totalElapsedTime: null == totalElapsedTime ? _self.totalElapsedTime : totalElapsedTime // ignore: cast_nullable_to_non_nullable
as Duration,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,stepsSummary: null == stepsSummary ? _self.stepsSummary : stepsSummary // ignore: cast_nullable_to_non_nullable
as List<SummaryStep>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallengeState].
extension ChallengeStatePatterns on ChallengeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengeState value)  $default,){
final _that = this;
switch (_that) {
case _ChallengeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengeState value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStepIndex,  Duration elapsedTime,  Duration totalElapsedTime,  bool isRunning,  bool isCompleted,  List<SummaryStep> stepsSummary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengeState() when $default != null:
return $default(_that.currentStepIndex,_that.elapsedTime,_that.totalElapsedTime,_that.isRunning,_that.isCompleted,_that.stepsSummary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStepIndex,  Duration elapsedTime,  Duration totalElapsedTime,  bool isRunning,  bool isCompleted,  List<SummaryStep> stepsSummary)  $default,) {final _that = this;
switch (_that) {
case _ChallengeState():
return $default(_that.currentStepIndex,_that.elapsedTime,_that.totalElapsedTime,_that.isRunning,_that.isCompleted,_that.stepsSummary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStepIndex,  Duration elapsedTime,  Duration totalElapsedTime,  bool isRunning,  bool isCompleted,  List<SummaryStep> stepsSummary)?  $default,) {final _that = this;
switch (_that) {
case _ChallengeState() when $default != null:
return $default(_that.currentStepIndex,_that.elapsedTime,_that.totalElapsedTime,_that.isRunning,_that.isCompleted,_that.stepsSummary);case _:
  return null;

}
}

}

/// @nodoc


class _ChallengeState implements ChallengeState {
  const _ChallengeState({required this.currentStepIndex, required this.elapsedTime, required this.totalElapsedTime, required this.isRunning, required this.isCompleted, required final  List<SummaryStep> stepsSummary}): _stepsSummary = stepsSummary;
  

@override final  int currentStepIndex;
@override final  Duration elapsedTime;
@override final  Duration totalElapsedTime;
@override final  bool isRunning;
@override final  bool isCompleted;
 final  List<SummaryStep> _stepsSummary;
@override List<SummaryStep> get stepsSummary {
  if (_stepsSummary is EqualUnmodifiableListView) return _stepsSummary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stepsSummary);
}


/// Create a copy of ChallengeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeStateCopyWith<_ChallengeState> get copyWith => __$ChallengeStateCopyWithImpl<_ChallengeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeState&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex)&&(identical(other.elapsedTime, elapsedTime) || other.elapsedTime == elapsedTime)&&(identical(other.totalElapsedTime, totalElapsedTime) || other.totalElapsedTime == totalElapsedTime)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&const DeepCollectionEquality().equals(other._stepsSummary, _stepsSummary));
}


@override
int get hashCode => Object.hash(runtimeType,currentStepIndex,elapsedTime,totalElapsedTime,isRunning,isCompleted,const DeepCollectionEquality().hash(_stepsSummary));

@override
String toString() {
  return 'ChallengeState(currentStepIndex: $currentStepIndex, elapsedTime: $elapsedTime, totalElapsedTime: $totalElapsedTime, isRunning: $isRunning, isCompleted: $isCompleted, stepsSummary: $stepsSummary)';
}


}

/// @nodoc
abstract mixin class _$ChallengeStateCopyWith<$Res> implements $ChallengeStateCopyWith<$Res> {
  factory _$ChallengeStateCopyWith(_ChallengeState value, $Res Function(_ChallengeState) _then) = __$ChallengeStateCopyWithImpl;
@override @useResult
$Res call({
 int currentStepIndex, Duration elapsedTime, Duration totalElapsedTime, bool isRunning, bool isCompleted, List<SummaryStep> stepsSummary
});




}
/// @nodoc
class __$ChallengeStateCopyWithImpl<$Res>
    implements _$ChallengeStateCopyWith<$Res> {
  __$ChallengeStateCopyWithImpl(this._self, this._then);

  final _ChallengeState _self;
  final $Res Function(_ChallengeState) _then;

/// Create a copy of ChallengeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStepIndex = null,Object? elapsedTime = null,Object? totalElapsedTime = null,Object? isRunning = null,Object? isCompleted = null,Object? stepsSummary = null,}) {
  return _then(_ChallengeState(
currentStepIndex: null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
as int,elapsedTime: null == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as Duration,totalElapsedTime: null == totalElapsedTime ? _self.totalElapsedTime : totalElapsedTime // ignore: cast_nullable_to_non_nullable
as Duration,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,stepsSummary: null == stepsSummary ? _self._stepsSummary : stepsSummary // ignore: cast_nullable_to_non_nullable
as List<SummaryStep>,
  ));
}


}

// dart format on
