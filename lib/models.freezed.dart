// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Ingredient {

 String get amount; String get name;
/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientCopyWith<Ingredient> get copyWith => _$IngredientCopyWithImpl<Ingredient>(this as Ingredient, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ingredient&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,amount,name);

@override
String toString() {
  return 'Ingredient(amount: $amount, name: $name)';
}


}

/// @nodoc
abstract mixin class $IngredientCopyWith<$Res>  {
  factory $IngredientCopyWith(Ingredient value, $Res Function(Ingredient) _then) = _$IngredientCopyWithImpl;
@useResult
$Res call({
 String amount, String name
});




}
/// @nodoc
class _$IngredientCopyWithImpl<$Res>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._self, this._then);

  final Ingredient _self;
  final $Res Function(Ingredient) _then;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? name = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Ingredient].
extension IngredientPatterns on Ingredient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ingredient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ingredient value)  $default,){
final _that = this;
switch (_that) {
case _Ingredient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ingredient value)?  $default,){
final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String amount,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
return $default(_that.amount,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String amount,  String name)  $default,) {final _that = this;
switch (_that) {
case _Ingredient():
return $default(_that.amount,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String amount,  String name)?  $default,) {final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
return $default(_that.amount,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _Ingredient implements Ingredient {
  const _Ingredient({required this.amount, required this.name});
  

@override final  String amount;
@override final  String name;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientCopyWith<_Ingredient> get copyWith => __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ingredient&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,amount,name);

@override
String toString() {
  return 'Ingredient(amount: $amount, name: $name)';
}


}

/// @nodoc
abstract mixin class _$IngredientCopyWith<$Res> implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(_Ingredient value, $Res Function(_Ingredient) _then) = __$IngredientCopyWithImpl;
@override @useResult
$Res call({
 String amount, String name
});




}
/// @nodoc
class __$IngredientCopyWithImpl<$Res>
    implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(this._self, this._then);

  final _Ingredient _self;
  final $Res Function(_Ingredient) _then;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? name = null,}) {
  return _then(_Ingredient(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RecipeStep {

 int get number; String get name; String get description; StepType get stepType; Duration get duration; Duration get acceptableMarginDuration; String? get comment;
/// Create a copy of RecipeStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeStepCopyWith<RecipeStep> get copyWith => _$RecipeStepCopyWithImpl<RecipeStep>(this as RecipeStep, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeStep&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.stepType, stepType) || other.stepType == stepType)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.acceptableMarginDuration, acceptableMarginDuration) || other.acceptableMarginDuration == acceptableMarginDuration)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,number,name,description,stepType,duration,acceptableMarginDuration,comment);

@override
String toString() {
  return 'RecipeStep(number: $number, name: $name, description: $description, stepType: $stepType, duration: $duration, acceptableMarginDuration: $acceptableMarginDuration, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $RecipeStepCopyWith<$Res>  {
  factory $RecipeStepCopyWith(RecipeStep value, $Res Function(RecipeStep) _then) = _$RecipeStepCopyWithImpl;
@useResult
$Res call({
 int number, String name, String description, StepType stepType, Duration duration, Duration acceptableMarginDuration, String? comment
});




}
/// @nodoc
class _$RecipeStepCopyWithImpl<$Res>
    implements $RecipeStepCopyWith<$Res> {
  _$RecipeStepCopyWithImpl(this._self, this._then);

  final RecipeStep _self;
  final $Res Function(RecipeStep) _then;

/// Create a copy of RecipeStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? name = null,Object? description = null,Object? stepType = null,Object? duration = null,Object? acceptableMarginDuration = null,Object? comment = freezed,}) {
  return _then(_self.copyWith(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,stepType: null == stepType ? _self.stepType : stepType // ignore: cast_nullable_to_non_nullable
as StepType,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,acceptableMarginDuration: null == acceptableMarginDuration ? _self.acceptableMarginDuration : acceptableMarginDuration // ignore: cast_nullable_to_non_nullable
as Duration,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeStep].
extension RecipeStepPatterns on RecipeStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeStep value)  $default,){
final _that = this;
switch (_that) {
case _RecipeStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeStep value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int number,  String name,  String description,  StepType stepType,  Duration duration,  Duration acceptableMarginDuration,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeStep() when $default != null:
return $default(_that.number,_that.name,_that.description,_that.stepType,_that.duration,_that.acceptableMarginDuration,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int number,  String name,  String description,  StepType stepType,  Duration duration,  Duration acceptableMarginDuration,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _RecipeStep():
return $default(_that.number,_that.name,_that.description,_that.stepType,_that.duration,_that.acceptableMarginDuration,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int number,  String name,  String description,  StepType stepType,  Duration duration,  Duration acceptableMarginDuration,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _RecipeStep() when $default != null:
return $default(_that.number,_that.name,_that.description,_that.stepType,_that.duration,_that.acceptableMarginDuration,_that.comment);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeStep implements RecipeStep {
  const _RecipeStep({required this.number, required this.name, required this.description, required this.stepType, required this.duration, required this.acceptableMarginDuration, this.comment});
  

@override final  int number;
@override final  String name;
@override final  String description;
@override final  StepType stepType;
@override final  Duration duration;
@override final  Duration acceptableMarginDuration;
@override final  String? comment;

/// Create a copy of RecipeStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeStepCopyWith<_RecipeStep> get copyWith => __$RecipeStepCopyWithImpl<_RecipeStep>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeStep&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.stepType, stepType) || other.stepType == stepType)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.acceptableMarginDuration, acceptableMarginDuration) || other.acceptableMarginDuration == acceptableMarginDuration)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,number,name,description,stepType,duration,acceptableMarginDuration,comment);

@override
String toString() {
  return 'RecipeStep(number: $number, name: $name, description: $description, stepType: $stepType, duration: $duration, acceptableMarginDuration: $acceptableMarginDuration, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$RecipeStepCopyWith<$Res> implements $RecipeStepCopyWith<$Res> {
  factory _$RecipeStepCopyWith(_RecipeStep value, $Res Function(_RecipeStep) _then) = __$RecipeStepCopyWithImpl;
@override @useResult
$Res call({
 int number, String name, String description, StepType stepType, Duration duration, Duration acceptableMarginDuration, String? comment
});




}
/// @nodoc
class __$RecipeStepCopyWithImpl<$Res>
    implements _$RecipeStepCopyWith<$Res> {
  __$RecipeStepCopyWithImpl(this._self, this._then);

  final _RecipeStep _self;
  final $Res Function(_RecipeStep) _then;

/// Create a copy of RecipeStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? name = null,Object? description = null,Object? stepType = null,Object? duration = null,Object? acceptableMarginDuration = null,Object? comment = freezed,}) {
  return _then(_RecipeStep(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,stepType: null == stepType ? _self.stepType : stepType // ignore: cast_nullable_to_non_nullable
as StepType,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,acceptableMarginDuration: null == acceptableMarginDuration ? _self.acceptableMarginDuration : acceptableMarginDuration // ignore: cast_nullable_to_non_nullable
as Duration,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$SummaryStep {

 RecipeStep get step; Duration get timeTaken; AcceptanceMarginStatus get marginStatus; Duration get totalTimeTaken;
/// Create a copy of SummaryStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryStepCopyWith<SummaryStep> get copyWith => _$SummaryStepCopyWithImpl<SummaryStep>(this as SummaryStep, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryStep&&(identical(other.step, step) || other.step == step)&&(identical(other.timeTaken, timeTaken) || other.timeTaken == timeTaken)&&(identical(other.marginStatus, marginStatus) || other.marginStatus == marginStatus)&&(identical(other.totalTimeTaken, totalTimeTaken) || other.totalTimeTaken == totalTimeTaken));
}


@override
int get hashCode => Object.hash(runtimeType,step,timeTaken,marginStatus,totalTimeTaken);

@override
String toString() {
  return 'SummaryStep(step: $step, timeTaken: $timeTaken, marginStatus: $marginStatus, totalTimeTaken: $totalTimeTaken)';
}


}

/// @nodoc
abstract mixin class $SummaryStepCopyWith<$Res>  {
  factory $SummaryStepCopyWith(SummaryStep value, $Res Function(SummaryStep) _then) = _$SummaryStepCopyWithImpl;
@useResult
$Res call({
 RecipeStep step, Duration timeTaken, AcceptanceMarginStatus marginStatus, Duration totalTimeTaken
});


$RecipeStepCopyWith<$Res> get step;

}
/// @nodoc
class _$SummaryStepCopyWithImpl<$Res>
    implements $SummaryStepCopyWith<$Res> {
  _$SummaryStepCopyWithImpl(this._self, this._then);

  final SummaryStep _self;
  final $Res Function(SummaryStep) _then;

/// Create a copy of SummaryStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? timeTaken = null,Object? marginStatus = null,Object? totalTimeTaken = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as RecipeStep,timeTaken: null == timeTaken ? _self.timeTaken : timeTaken // ignore: cast_nullable_to_non_nullable
as Duration,marginStatus: null == marginStatus ? _self.marginStatus : marginStatus // ignore: cast_nullable_to_non_nullable
as AcceptanceMarginStatus,totalTimeTaken: null == totalTimeTaken ? _self.totalTimeTaken : totalTimeTaken // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}
/// Create a copy of SummaryStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeStepCopyWith<$Res> get step {
  
  return $RecipeStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}


/// Adds pattern-matching-related methods to [SummaryStep].
extension SummaryStepPatterns on SummaryStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummaryStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummaryStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummaryStep value)  $default,){
final _that = this;
switch (_that) {
case _SummaryStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummaryStep value)?  $default,){
final _that = this;
switch (_that) {
case _SummaryStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RecipeStep step,  Duration timeTaken,  AcceptanceMarginStatus marginStatus,  Duration totalTimeTaken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummaryStep() when $default != null:
return $default(_that.step,_that.timeTaken,_that.marginStatus,_that.totalTimeTaken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RecipeStep step,  Duration timeTaken,  AcceptanceMarginStatus marginStatus,  Duration totalTimeTaken)  $default,) {final _that = this;
switch (_that) {
case _SummaryStep():
return $default(_that.step,_that.timeTaken,_that.marginStatus,_that.totalTimeTaken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RecipeStep step,  Duration timeTaken,  AcceptanceMarginStatus marginStatus,  Duration totalTimeTaken)?  $default,) {final _that = this;
switch (_that) {
case _SummaryStep() when $default != null:
return $default(_that.step,_that.timeTaken,_that.marginStatus,_that.totalTimeTaken);case _:
  return null;

}
}

}

/// @nodoc


class _SummaryStep implements SummaryStep {
  const _SummaryStep({required this.step, required this.timeTaken, required this.marginStatus, required this.totalTimeTaken});
  

@override final  RecipeStep step;
@override final  Duration timeTaken;
@override final  AcceptanceMarginStatus marginStatus;
@override final  Duration totalTimeTaken;

/// Create a copy of SummaryStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryStepCopyWith<_SummaryStep> get copyWith => __$SummaryStepCopyWithImpl<_SummaryStep>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummaryStep&&(identical(other.step, step) || other.step == step)&&(identical(other.timeTaken, timeTaken) || other.timeTaken == timeTaken)&&(identical(other.marginStatus, marginStatus) || other.marginStatus == marginStatus)&&(identical(other.totalTimeTaken, totalTimeTaken) || other.totalTimeTaken == totalTimeTaken));
}


@override
int get hashCode => Object.hash(runtimeType,step,timeTaken,marginStatus,totalTimeTaken);

@override
String toString() {
  return 'SummaryStep(step: $step, timeTaken: $timeTaken, marginStatus: $marginStatus, totalTimeTaken: $totalTimeTaken)';
}


}

/// @nodoc
abstract mixin class _$SummaryStepCopyWith<$Res> implements $SummaryStepCopyWith<$Res> {
  factory _$SummaryStepCopyWith(_SummaryStep value, $Res Function(_SummaryStep) _then) = __$SummaryStepCopyWithImpl;
@override @useResult
$Res call({
 RecipeStep step, Duration timeTaken, AcceptanceMarginStatus marginStatus, Duration totalTimeTaken
});


@override $RecipeStepCopyWith<$Res> get step;

}
/// @nodoc
class __$SummaryStepCopyWithImpl<$Res>
    implements _$SummaryStepCopyWith<$Res> {
  __$SummaryStepCopyWithImpl(this._self, this._then);

  final _SummaryStep _self;
  final $Res Function(_SummaryStep) _then;

/// Create a copy of SummaryStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? timeTaken = null,Object? marginStatus = null,Object? totalTimeTaken = null,}) {
  return _then(_SummaryStep(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as RecipeStep,timeTaken: null == timeTaken ? _self.timeTaken : timeTaken // ignore: cast_nullable_to_non_nullable
as Duration,marginStatus: null == marginStatus ? _self.marginStatus : marginStatus // ignore: cast_nullable_to_non_nullable
as AcceptanceMarginStatus,totalTimeTaken: null == totalTimeTaken ? _self.totalTimeTaken : totalTimeTaken // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

/// Create a copy of SummaryStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeStepCopyWith<$Res> get step {
  
  return $RecipeStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}

/// @nodoc
mixin _$Recipe {

 String get name; List<Tag> get tags; RecipeType get recipeType; Difficulty get difficulty; String get description; List<Ingredient> get ingredients; int get calories; int get protein; int get carbs; List<RecipeStep> get steps; String get imageUrl;
/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeCopyWith<Recipe> get copyWith => _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipe&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.recipeType, recipeType) || other.recipeType == recipeType)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&const DeepCollectionEquality().equals(other.steps, steps)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(tags),recipeType,difficulty,description,const DeepCollectionEquality().hash(ingredients),calories,protein,carbs,const DeepCollectionEquality().hash(steps),imageUrl);

@override
String toString() {
  return 'Recipe(name: $name, tags: $tags, recipeType: $recipeType, difficulty: $difficulty, description: $description, ingredients: $ingredients, calories: $calories, protein: $protein, carbs: $carbs, steps: $steps, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res>  {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) = _$RecipeCopyWithImpl;
@useResult
$Res call({
 String name, List<Tag> tags, RecipeType recipeType, Difficulty difficulty, String description, List<Ingredient> ingredients, int calories, int protein, int carbs, List<RecipeStep> steps, String imageUrl
});




}
/// @nodoc
class _$RecipeCopyWithImpl<$Res>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? tags = null,Object? recipeType = null,Object? difficulty = null,Object? description = null,Object? ingredients = null,Object? calories = null,Object? protein = null,Object? carbs = null,Object? steps = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,recipeType: null == recipeType ? _self.recipeType : recipeType // ignore: cast_nullable_to_non_nullable
as RecipeType,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,protein: null == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as int,carbs: null == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as int,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<RecipeStep>,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Recipe].
extension RecipePatterns on Recipe {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Recipe value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Recipe() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Recipe value)  $default,){
final _that = this;
switch (_that) {
case _Recipe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Recipe value)?  $default,){
final _that = this;
switch (_that) {
case _Recipe() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<Tag> tags,  RecipeType recipeType,  Difficulty difficulty,  String description,  List<Ingredient> ingredients,  int calories,  int protein,  int carbs,  List<RecipeStep> steps,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that.name,_that.tags,_that.recipeType,_that.difficulty,_that.description,_that.ingredients,_that.calories,_that.protein,_that.carbs,_that.steps,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<Tag> tags,  RecipeType recipeType,  Difficulty difficulty,  String description,  List<Ingredient> ingredients,  int calories,  int protein,  int carbs,  List<RecipeStep> steps,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _Recipe():
return $default(_that.name,_that.tags,_that.recipeType,_that.difficulty,_that.description,_that.ingredients,_that.calories,_that.protein,_that.carbs,_that.steps,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<Tag> tags,  RecipeType recipeType,  Difficulty difficulty,  String description,  List<Ingredient> ingredients,  int calories,  int protein,  int carbs,  List<RecipeStep> steps,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that.name,_that.tags,_that.recipeType,_that.difficulty,_that.description,_that.ingredients,_that.calories,_that.protein,_that.carbs,_that.steps,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Recipe implements Recipe {
  const _Recipe({required this.name, required final  List<Tag> tags, required this.recipeType, required this.difficulty, required this.description, required final  List<Ingredient> ingredients, required this.calories, required this.protein, required this.carbs, required final  List<RecipeStep> steps, required this.imageUrl}): _tags = tags,_ingredients = ingredients,_steps = steps;
  

@override final  String name;
 final  List<Tag> _tags;
@override List<Tag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  RecipeType recipeType;
@override final  Difficulty difficulty;
@override final  String description;
 final  List<Ingredient> _ingredients;
@override List<Ingredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

@override final  int calories;
@override final  int protein;
@override final  int carbs;
 final  List<RecipeStep> _steps;
@override List<RecipeStep> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

@override final  String imageUrl;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeCopyWith<_Recipe> get copyWith => __$RecipeCopyWithImpl<_Recipe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recipe&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.recipeType, recipeType) || other.recipeType == recipeType)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&const DeepCollectionEquality().equals(other._steps, _steps)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_tags),recipeType,difficulty,description,const DeepCollectionEquality().hash(_ingredients),calories,protein,carbs,const DeepCollectionEquality().hash(_steps),imageUrl);

@override
String toString() {
  return 'Recipe(name: $name, tags: $tags, recipeType: $recipeType, difficulty: $difficulty, description: $description, ingredients: $ingredients, calories: $calories, protein: $protein, carbs: $carbs, steps: $steps, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) _then) = __$RecipeCopyWithImpl;
@override @useResult
$Res call({
 String name, List<Tag> tags, RecipeType recipeType, Difficulty difficulty, String description, List<Ingredient> ingredients, int calories, int protein, int carbs, List<RecipeStep> steps, String imageUrl
});




}
/// @nodoc
class __$RecipeCopyWithImpl<$Res>
    implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(this._self, this._then);

  final _Recipe _self;
  final $Res Function(_Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? tags = null,Object? recipeType = null,Object? difficulty = null,Object? description = null,Object? ingredients = null,Object? calories = null,Object? protein = null,Object? carbs = null,Object? steps = null,Object? imageUrl = null,}) {
  return _then(_Recipe(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,recipeType: null == recipeType ? _self.recipeType : recipeType // ignore: cast_nullable_to_non_nullable
as RecipeType,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,protein: null == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as int,carbs: null == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as int,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<RecipeStep>,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RecipeHistory {

 Recipe get recipe; List<SummaryStep> get summary;
/// Create a copy of RecipeHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeHistoryCopyWith<RecipeHistory> get copyWith => _$RecipeHistoryCopyWithImpl<RecipeHistory>(this as RecipeHistory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeHistory&&(identical(other.recipe, recipe) || other.recipe == recipe)&&const DeepCollectionEquality().equals(other.summary, summary));
}


@override
int get hashCode => Object.hash(runtimeType,recipe,const DeepCollectionEquality().hash(summary));

@override
String toString() {
  return 'RecipeHistory(recipe: $recipe, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $RecipeHistoryCopyWith<$Res>  {
  factory $RecipeHistoryCopyWith(RecipeHistory value, $Res Function(RecipeHistory) _then) = _$RecipeHistoryCopyWithImpl;
@useResult
$Res call({
 Recipe recipe, List<SummaryStep> summary
});


$RecipeCopyWith<$Res> get recipe;

}
/// @nodoc
class _$RecipeHistoryCopyWithImpl<$Res>
    implements $RecipeHistoryCopyWith<$Res> {
  _$RecipeHistoryCopyWithImpl(this._self, this._then);

  final RecipeHistory _self;
  final $Res Function(RecipeHistory) _then;

/// Create a copy of RecipeHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipe = null,Object? summary = null,}) {
  return _then(_self.copyWith(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as Recipe,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as List<SummaryStep>,
  ));
}
/// Create a copy of RecipeHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res> get recipe {
  
  return $RecipeCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecipeHistory].
extension RecipeHistoryPatterns on RecipeHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeHistory value)  $default,){
final _that = this;
switch (_that) {
case _RecipeHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeHistory value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Recipe recipe,  List<SummaryStep> summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeHistory() when $default != null:
return $default(_that.recipe,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Recipe recipe,  List<SummaryStep> summary)  $default,) {final _that = this;
switch (_that) {
case _RecipeHistory():
return $default(_that.recipe,_that.summary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Recipe recipe,  List<SummaryStep> summary)?  $default,) {final _that = this;
switch (_that) {
case _RecipeHistory() when $default != null:
return $default(_that.recipe,_that.summary);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeHistory implements RecipeHistory {
  const _RecipeHistory({required this.recipe, required final  List<SummaryStep> summary}): _summary = summary;
  

@override final  Recipe recipe;
 final  List<SummaryStep> _summary;
@override List<SummaryStep> get summary {
  if (_summary is EqualUnmodifiableListView) return _summary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_summary);
}


/// Create a copy of RecipeHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeHistoryCopyWith<_RecipeHistory> get copyWith => __$RecipeHistoryCopyWithImpl<_RecipeHistory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeHistory&&(identical(other.recipe, recipe) || other.recipe == recipe)&&const DeepCollectionEquality().equals(other._summary, _summary));
}


@override
int get hashCode => Object.hash(runtimeType,recipe,const DeepCollectionEquality().hash(_summary));

@override
String toString() {
  return 'RecipeHistory(recipe: $recipe, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$RecipeHistoryCopyWith<$Res> implements $RecipeHistoryCopyWith<$Res> {
  factory _$RecipeHistoryCopyWith(_RecipeHistory value, $Res Function(_RecipeHistory) _then) = __$RecipeHistoryCopyWithImpl;
@override @useResult
$Res call({
 Recipe recipe, List<SummaryStep> summary
});


@override $RecipeCopyWith<$Res> get recipe;

}
/// @nodoc
class __$RecipeHistoryCopyWithImpl<$Res>
    implements _$RecipeHistoryCopyWith<$Res> {
  __$RecipeHistoryCopyWithImpl(this._self, this._then);

  final _RecipeHistory _self;
  final $Res Function(_RecipeHistory) _then;

/// Create a copy of RecipeHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipe = null,Object? summary = null,}) {
  return _then(_RecipeHistory(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as Recipe,summary: null == summary ? _self._summary : summary // ignore: cast_nullable_to_non_nullable
as List<SummaryStep>,
  ));
}

/// Create a copy of RecipeHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res> get recipe {
  
  return $RecipeCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}

// dart format on
