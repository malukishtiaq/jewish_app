// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OtpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() optLoading,
    required TResult Function(AppErrors error, VoidCallback callback) optError,
    required TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)
        optVerificationError,
    required TResult Function(ValidateOtpEntity entity, VerificationType type)
        optVerifiedSuccess,
    required TResult Function(SendOtpEntity entity) optRequestSuccess,
    required TResult Function() profileUpdateSuccess,
    required TResult Function(SendOtpEntity entity) codeResentSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? optLoading,
    TResult? Function(AppErrors error, VoidCallback callback)? optError,
    TResult? Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult? Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult? Function(SendOtpEntity entity)? optRequestSuccess,
    TResult? Function()? profileUpdateSuccess,
    TResult? Function(SendOtpEntity entity)? codeResentSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? optLoading,
    TResult Function(AppErrors error, VoidCallback callback)? optError,
    TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult Function(SendOtpEntity entity)? optRequestSuccess,
    TResult Function()? profileUpdateSuccess,
    TResult Function(SendOtpEntity entity)? codeResentSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtpInit value) init,
    required TResult Function(OtpLoading value) optLoading,
    required TResult Function(SetupEntityError value) optError,
    required TResult Function(SetupEntityVerificationError value)
        optVerificationError,
    required TResult Function(OtpVerifiedSuccessState value) optVerifiedSuccess,
    required TResult Function(OtpRequestSuccessState value) optRequestSuccess,
    required TResult Function(ProfileUpdateSuccessState value)
        profileUpdateSuccess,
    required TResult Function(CodeResentSuccessState value) codeResentSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtpInit value)? init,
    TResult? Function(OtpLoading value)? optLoading,
    TResult? Function(SetupEntityError value)? optError,
    TResult? Function(SetupEntityVerificationError value)? optVerificationError,
    TResult? Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult? Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult? Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult? Function(CodeResentSuccessState value)? codeResentSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtpInit value)? init,
    TResult Function(OtpLoading value)? optLoading,
    TResult Function(SetupEntityError value)? optError,
    TResult Function(SetupEntityVerificationError value)? optVerificationError,
    TResult Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult Function(CodeResentSuccessState value)? codeResentSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpStateCopyWith<$Res> {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) then) =
      _$OtpStateCopyWithImpl<$Res, OtpState>;
}

/// @nodoc
class _$OtpStateCopyWithImpl<$Res, $Val extends OtpState>
    implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OtpInitImplCopyWith<$Res> {
  factory _$$OtpInitImplCopyWith(
          _$OtpInitImpl value, $Res Function(_$OtpInitImpl) then) =
      __$$OtpInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OtpInitImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$OtpInitImpl>
    implements _$$OtpInitImplCopyWith<$Res> {
  __$$OtpInitImplCopyWithImpl(
      _$OtpInitImpl _value, $Res Function(_$OtpInitImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OtpInitImpl implements OtpInit {
  const _$OtpInitImpl();

  @override
  String toString() {
    return 'OtpState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OtpInitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() optLoading,
    required TResult Function(AppErrors error, VoidCallback callback) optError,
    required TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)
        optVerificationError,
    required TResult Function(ValidateOtpEntity entity, VerificationType type)
        optVerifiedSuccess,
    required TResult Function(SendOtpEntity entity) optRequestSuccess,
    required TResult Function() profileUpdateSuccess,
    required TResult Function(SendOtpEntity entity) codeResentSuccess,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? optLoading,
    TResult? Function(AppErrors error, VoidCallback callback)? optError,
    TResult? Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult? Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult? Function(SendOtpEntity entity)? optRequestSuccess,
    TResult? Function()? profileUpdateSuccess,
    TResult? Function(SendOtpEntity entity)? codeResentSuccess,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? optLoading,
    TResult Function(AppErrors error, VoidCallback callback)? optError,
    TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult Function(SendOtpEntity entity)? optRequestSuccess,
    TResult Function()? profileUpdateSuccess,
    TResult Function(SendOtpEntity entity)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtpInit value) init,
    required TResult Function(OtpLoading value) optLoading,
    required TResult Function(SetupEntityError value) optError,
    required TResult Function(SetupEntityVerificationError value)
        optVerificationError,
    required TResult Function(OtpVerifiedSuccessState value) optVerifiedSuccess,
    required TResult Function(OtpRequestSuccessState value) optRequestSuccess,
    required TResult Function(ProfileUpdateSuccessState value)
        profileUpdateSuccess,
    required TResult Function(CodeResentSuccessState value) codeResentSuccess,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtpInit value)? init,
    TResult? Function(OtpLoading value)? optLoading,
    TResult? Function(SetupEntityError value)? optError,
    TResult? Function(SetupEntityVerificationError value)? optVerificationError,
    TResult? Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult? Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult? Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult? Function(CodeResentSuccessState value)? codeResentSuccess,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtpInit value)? init,
    TResult Function(OtpLoading value)? optLoading,
    TResult Function(SetupEntityError value)? optError,
    TResult Function(SetupEntityVerificationError value)? optVerificationError,
    TResult Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult Function(CodeResentSuccessState value)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class OtpInit implements OtpState {
  const factory OtpInit() = _$OtpInitImpl;
}

/// @nodoc
abstract class _$$OtpLoadingImplCopyWith<$Res> {
  factory _$$OtpLoadingImplCopyWith(
          _$OtpLoadingImpl value, $Res Function(_$OtpLoadingImpl) then) =
      __$$OtpLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OtpLoadingImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$OtpLoadingImpl>
    implements _$$OtpLoadingImplCopyWith<$Res> {
  __$$OtpLoadingImplCopyWithImpl(
      _$OtpLoadingImpl _value, $Res Function(_$OtpLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OtpLoadingImpl implements OtpLoading {
  const _$OtpLoadingImpl();

  @override
  String toString() {
    return 'OtpState.optLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OtpLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() optLoading,
    required TResult Function(AppErrors error, VoidCallback callback) optError,
    required TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)
        optVerificationError,
    required TResult Function(ValidateOtpEntity entity, VerificationType type)
        optVerifiedSuccess,
    required TResult Function(SendOtpEntity entity) optRequestSuccess,
    required TResult Function() profileUpdateSuccess,
    required TResult Function(SendOtpEntity entity) codeResentSuccess,
  }) {
    return optLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? optLoading,
    TResult? Function(AppErrors error, VoidCallback callback)? optError,
    TResult? Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult? Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult? Function(SendOtpEntity entity)? optRequestSuccess,
    TResult? Function()? profileUpdateSuccess,
    TResult? Function(SendOtpEntity entity)? codeResentSuccess,
  }) {
    return optLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? optLoading,
    TResult Function(AppErrors error, VoidCallback callback)? optError,
    TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult Function(SendOtpEntity entity)? optRequestSuccess,
    TResult Function()? profileUpdateSuccess,
    TResult Function(SendOtpEntity entity)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (optLoading != null) {
      return optLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtpInit value) init,
    required TResult Function(OtpLoading value) optLoading,
    required TResult Function(SetupEntityError value) optError,
    required TResult Function(SetupEntityVerificationError value)
        optVerificationError,
    required TResult Function(OtpVerifiedSuccessState value) optVerifiedSuccess,
    required TResult Function(OtpRequestSuccessState value) optRequestSuccess,
    required TResult Function(ProfileUpdateSuccessState value)
        profileUpdateSuccess,
    required TResult Function(CodeResentSuccessState value) codeResentSuccess,
  }) {
    return optLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtpInit value)? init,
    TResult? Function(OtpLoading value)? optLoading,
    TResult? Function(SetupEntityError value)? optError,
    TResult? Function(SetupEntityVerificationError value)? optVerificationError,
    TResult? Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult? Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult? Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult? Function(CodeResentSuccessState value)? codeResentSuccess,
  }) {
    return optLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtpInit value)? init,
    TResult Function(OtpLoading value)? optLoading,
    TResult Function(SetupEntityError value)? optError,
    TResult Function(SetupEntityVerificationError value)? optVerificationError,
    TResult Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult Function(CodeResentSuccessState value)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (optLoading != null) {
      return optLoading(this);
    }
    return orElse();
  }
}

abstract class OtpLoading implements OtpState {
  const factory OtpLoading() = _$OtpLoadingImpl;
}

/// @nodoc
abstract class _$$SetupEntityErrorImplCopyWith<$Res> {
  factory _$$SetupEntityErrorImplCopyWith(_$SetupEntityErrorImpl value,
          $Res Function(_$SetupEntityErrorImpl) then) =
      __$$SetupEntityErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$SetupEntityErrorImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$SetupEntityErrorImpl>
    implements _$$SetupEntityErrorImplCopyWith<$Res> {
  __$$SetupEntityErrorImplCopyWithImpl(_$SetupEntityErrorImpl _value,
      $Res Function(_$SetupEntityErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? callback = null,
  }) {
    return _then(_$SetupEntityErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppErrors,
      null == callback
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppErrorsCopyWith<$Res> get error {
    return $AppErrorsCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$SetupEntityErrorImpl implements SetupEntityError {
  const _$SetupEntityErrorImpl(this.error, this.callback);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'OtpState.optError(error: $error, callback: $callback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetupEntityErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, callback);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetupEntityErrorImplCopyWith<_$SetupEntityErrorImpl> get copyWith =>
      __$$SetupEntityErrorImplCopyWithImpl<_$SetupEntityErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() optLoading,
    required TResult Function(AppErrors error, VoidCallback callback) optError,
    required TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)
        optVerificationError,
    required TResult Function(ValidateOtpEntity entity, VerificationType type)
        optVerifiedSuccess,
    required TResult Function(SendOtpEntity entity) optRequestSuccess,
    required TResult Function() profileUpdateSuccess,
    required TResult Function(SendOtpEntity entity) codeResentSuccess,
  }) {
    return optError(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? optLoading,
    TResult? Function(AppErrors error, VoidCallback callback)? optError,
    TResult? Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult? Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult? Function(SendOtpEntity entity)? optRequestSuccess,
    TResult? Function()? profileUpdateSuccess,
    TResult? Function(SendOtpEntity entity)? codeResentSuccess,
  }) {
    return optError?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? optLoading,
    TResult Function(AppErrors error, VoidCallback callback)? optError,
    TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult Function(SendOtpEntity entity)? optRequestSuccess,
    TResult Function()? profileUpdateSuccess,
    TResult Function(SendOtpEntity entity)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (optError != null) {
      return optError(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtpInit value) init,
    required TResult Function(OtpLoading value) optLoading,
    required TResult Function(SetupEntityError value) optError,
    required TResult Function(SetupEntityVerificationError value)
        optVerificationError,
    required TResult Function(OtpVerifiedSuccessState value) optVerifiedSuccess,
    required TResult Function(OtpRequestSuccessState value) optRequestSuccess,
    required TResult Function(ProfileUpdateSuccessState value)
        profileUpdateSuccess,
    required TResult Function(CodeResentSuccessState value) codeResentSuccess,
  }) {
    return optError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtpInit value)? init,
    TResult? Function(OtpLoading value)? optLoading,
    TResult? Function(SetupEntityError value)? optError,
    TResult? Function(SetupEntityVerificationError value)? optVerificationError,
    TResult? Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult? Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult? Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult? Function(CodeResentSuccessState value)? codeResentSuccess,
  }) {
    return optError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtpInit value)? init,
    TResult Function(OtpLoading value)? optLoading,
    TResult Function(SetupEntityError value)? optError,
    TResult Function(SetupEntityVerificationError value)? optVerificationError,
    TResult Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult Function(CodeResentSuccessState value)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (optError != null) {
      return optError(this);
    }
    return orElse();
  }
}

abstract class SetupEntityError implements OtpState {
  const factory SetupEntityError(
          final AppErrors error, final VoidCallback callback) =
      _$SetupEntityErrorImpl;

  AppErrors get error;
  VoidCallback get callback;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetupEntityErrorImplCopyWith<_$SetupEntityErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetupEntityVerificationErrorImplCopyWith<$Res> {
  factory _$$SetupEntityVerificationErrorImplCopyWith(
          _$SetupEntityVerificationErrorImpl value,
          $Res Function(_$SetupEntityVerificationErrorImpl) then) =
      __$$SetupEntityVerificationErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppErrors error, VoidCallback callback, VerificationType type});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$SetupEntityVerificationErrorImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$SetupEntityVerificationErrorImpl>
    implements _$$SetupEntityVerificationErrorImplCopyWith<$Res> {
  __$$SetupEntityVerificationErrorImplCopyWithImpl(
      _$SetupEntityVerificationErrorImpl _value,
      $Res Function(_$SetupEntityVerificationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? callback = null,
    Object? type = null,
  }) {
    return _then(_$SetupEntityVerificationErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppErrors,
      null == callback
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VerificationType,
    ));
  }

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppErrorsCopyWith<$Res> get error {
    return $AppErrorsCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$SetupEntityVerificationErrorImpl
    implements SetupEntityVerificationError {
  const _$SetupEntityVerificationErrorImpl(
      this.error, this.callback, this.type);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;
  @override
  final VerificationType type;

  @override
  String toString() {
    return 'OtpState.optVerificationError(error: $error, callback: $callback, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetupEntityVerificationErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.callback, callback) ||
                other.callback == callback) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, callback, type);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetupEntityVerificationErrorImplCopyWith<
          _$SetupEntityVerificationErrorImpl>
      get copyWith => __$$SetupEntityVerificationErrorImplCopyWithImpl<
          _$SetupEntityVerificationErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() optLoading,
    required TResult Function(AppErrors error, VoidCallback callback) optError,
    required TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)
        optVerificationError,
    required TResult Function(ValidateOtpEntity entity, VerificationType type)
        optVerifiedSuccess,
    required TResult Function(SendOtpEntity entity) optRequestSuccess,
    required TResult Function() profileUpdateSuccess,
    required TResult Function(SendOtpEntity entity) codeResentSuccess,
  }) {
    return optVerificationError(error, callback, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? optLoading,
    TResult? Function(AppErrors error, VoidCallback callback)? optError,
    TResult? Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult? Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult? Function(SendOtpEntity entity)? optRequestSuccess,
    TResult? Function()? profileUpdateSuccess,
    TResult? Function(SendOtpEntity entity)? codeResentSuccess,
  }) {
    return optVerificationError?.call(error, callback, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? optLoading,
    TResult Function(AppErrors error, VoidCallback callback)? optError,
    TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult Function(SendOtpEntity entity)? optRequestSuccess,
    TResult Function()? profileUpdateSuccess,
    TResult Function(SendOtpEntity entity)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (optVerificationError != null) {
      return optVerificationError(error, callback, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtpInit value) init,
    required TResult Function(OtpLoading value) optLoading,
    required TResult Function(SetupEntityError value) optError,
    required TResult Function(SetupEntityVerificationError value)
        optVerificationError,
    required TResult Function(OtpVerifiedSuccessState value) optVerifiedSuccess,
    required TResult Function(OtpRequestSuccessState value) optRequestSuccess,
    required TResult Function(ProfileUpdateSuccessState value)
        profileUpdateSuccess,
    required TResult Function(CodeResentSuccessState value) codeResentSuccess,
  }) {
    return optVerificationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtpInit value)? init,
    TResult? Function(OtpLoading value)? optLoading,
    TResult? Function(SetupEntityError value)? optError,
    TResult? Function(SetupEntityVerificationError value)? optVerificationError,
    TResult? Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult? Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult? Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult? Function(CodeResentSuccessState value)? codeResentSuccess,
  }) {
    return optVerificationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtpInit value)? init,
    TResult Function(OtpLoading value)? optLoading,
    TResult Function(SetupEntityError value)? optError,
    TResult Function(SetupEntityVerificationError value)? optVerificationError,
    TResult Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult Function(CodeResentSuccessState value)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (optVerificationError != null) {
      return optVerificationError(this);
    }
    return orElse();
  }
}

abstract class SetupEntityVerificationError implements OtpState {
  const factory SetupEntityVerificationError(
      final AppErrors error,
      final VoidCallback callback,
      final VerificationType type) = _$SetupEntityVerificationErrorImpl;

  AppErrors get error;
  VoidCallback get callback;
  VerificationType get type;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetupEntityVerificationErrorImplCopyWith<
          _$SetupEntityVerificationErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpVerifiedSuccessStateImplCopyWith<$Res> {
  factory _$$OtpVerifiedSuccessStateImplCopyWith(
          _$OtpVerifiedSuccessStateImpl value,
          $Res Function(_$OtpVerifiedSuccessStateImpl) then) =
      __$$OtpVerifiedSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ValidateOtpEntity entity, VerificationType type});
}

/// @nodoc
class __$$OtpVerifiedSuccessStateImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$OtpVerifiedSuccessStateImpl>
    implements _$$OtpVerifiedSuccessStateImplCopyWith<$Res> {
  __$$OtpVerifiedSuccessStateImplCopyWithImpl(
      _$OtpVerifiedSuccessStateImpl _value,
      $Res Function(_$OtpVerifiedSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
    Object? type = null,
  }) {
    return _then(_$OtpVerifiedSuccessStateImpl(
      null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as ValidateOtpEntity,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VerificationType,
    ));
  }
}

/// @nodoc

class _$OtpVerifiedSuccessStateImpl implements OtpVerifiedSuccessState {
  const _$OtpVerifiedSuccessStateImpl(this.entity, this.type);

  @override
  final ValidateOtpEntity entity;
  @override
  final VerificationType type;

  @override
  String toString() {
    return 'OtpState.optVerifiedSuccess(entity: $entity, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerifiedSuccessStateImpl &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entity, type);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerifiedSuccessStateImplCopyWith<_$OtpVerifiedSuccessStateImpl>
      get copyWith => __$$OtpVerifiedSuccessStateImplCopyWithImpl<
          _$OtpVerifiedSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() optLoading,
    required TResult Function(AppErrors error, VoidCallback callback) optError,
    required TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)
        optVerificationError,
    required TResult Function(ValidateOtpEntity entity, VerificationType type)
        optVerifiedSuccess,
    required TResult Function(SendOtpEntity entity) optRequestSuccess,
    required TResult Function() profileUpdateSuccess,
    required TResult Function(SendOtpEntity entity) codeResentSuccess,
  }) {
    return optVerifiedSuccess(entity, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? optLoading,
    TResult? Function(AppErrors error, VoidCallback callback)? optError,
    TResult? Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult? Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult? Function(SendOtpEntity entity)? optRequestSuccess,
    TResult? Function()? profileUpdateSuccess,
    TResult? Function(SendOtpEntity entity)? codeResentSuccess,
  }) {
    return optVerifiedSuccess?.call(entity, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? optLoading,
    TResult Function(AppErrors error, VoidCallback callback)? optError,
    TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult Function(SendOtpEntity entity)? optRequestSuccess,
    TResult Function()? profileUpdateSuccess,
    TResult Function(SendOtpEntity entity)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (optVerifiedSuccess != null) {
      return optVerifiedSuccess(entity, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtpInit value) init,
    required TResult Function(OtpLoading value) optLoading,
    required TResult Function(SetupEntityError value) optError,
    required TResult Function(SetupEntityVerificationError value)
        optVerificationError,
    required TResult Function(OtpVerifiedSuccessState value) optVerifiedSuccess,
    required TResult Function(OtpRequestSuccessState value) optRequestSuccess,
    required TResult Function(ProfileUpdateSuccessState value)
        profileUpdateSuccess,
    required TResult Function(CodeResentSuccessState value) codeResentSuccess,
  }) {
    return optVerifiedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtpInit value)? init,
    TResult? Function(OtpLoading value)? optLoading,
    TResult? Function(SetupEntityError value)? optError,
    TResult? Function(SetupEntityVerificationError value)? optVerificationError,
    TResult? Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult? Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult? Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult? Function(CodeResentSuccessState value)? codeResentSuccess,
  }) {
    return optVerifiedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtpInit value)? init,
    TResult Function(OtpLoading value)? optLoading,
    TResult Function(SetupEntityError value)? optError,
    TResult Function(SetupEntityVerificationError value)? optVerificationError,
    TResult Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult Function(CodeResentSuccessState value)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (optVerifiedSuccess != null) {
      return optVerifiedSuccess(this);
    }
    return orElse();
  }
}

abstract class OtpVerifiedSuccessState implements OtpState {
  const factory OtpVerifiedSuccessState(
          final ValidateOtpEntity entity, final VerificationType type) =
      _$OtpVerifiedSuccessStateImpl;

  ValidateOtpEntity get entity;
  VerificationType get type;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpVerifiedSuccessStateImplCopyWith<_$OtpVerifiedSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpRequestSuccessStateImplCopyWith<$Res> {
  factory _$$OtpRequestSuccessStateImplCopyWith(
          _$OtpRequestSuccessStateImpl value,
          $Res Function(_$OtpRequestSuccessStateImpl) then) =
      __$$OtpRequestSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SendOtpEntity entity});
}

/// @nodoc
class __$$OtpRequestSuccessStateImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$OtpRequestSuccessStateImpl>
    implements _$$OtpRequestSuccessStateImplCopyWith<$Res> {
  __$$OtpRequestSuccessStateImplCopyWithImpl(
      _$OtpRequestSuccessStateImpl _value,
      $Res Function(_$OtpRequestSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
  }) {
    return _then(_$OtpRequestSuccessStateImpl(
      null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as SendOtpEntity,
    ));
  }
}

/// @nodoc

class _$OtpRequestSuccessStateImpl implements OtpRequestSuccessState {
  const _$OtpRequestSuccessStateImpl(this.entity);

  @override
  final SendOtpEntity entity;

  @override
  String toString() {
    return 'OtpState.optRequestSuccess(entity: $entity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpRequestSuccessStateImpl &&
            (identical(other.entity, entity) || other.entity == entity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entity);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpRequestSuccessStateImplCopyWith<_$OtpRequestSuccessStateImpl>
      get copyWith => __$$OtpRequestSuccessStateImplCopyWithImpl<
          _$OtpRequestSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() optLoading,
    required TResult Function(AppErrors error, VoidCallback callback) optError,
    required TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)
        optVerificationError,
    required TResult Function(ValidateOtpEntity entity, VerificationType type)
        optVerifiedSuccess,
    required TResult Function(SendOtpEntity entity) optRequestSuccess,
    required TResult Function() profileUpdateSuccess,
    required TResult Function(SendOtpEntity entity) codeResentSuccess,
  }) {
    return optRequestSuccess(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? optLoading,
    TResult? Function(AppErrors error, VoidCallback callback)? optError,
    TResult? Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult? Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult? Function(SendOtpEntity entity)? optRequestSuccess,
    TResult? Function()? profileUpdateSuccess,
    TResult? Function(SendOtpEntity entity)? codeResentSuccess,
  }) {
    return optRequestSuccess?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? optLoading,
    TResult Function(AppErrors error, VoidCallback callback)? optError,
    TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult Function(SendOtpEntity entity)? optRequestSuccess,
    TResult Function()? profileUpdateSuccess,
    TResult Function(SendOtpEntity entity)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (optRequestSuccess != null) {
      return optRequestSuccess(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtpInit value) init,
    required TResult Function(OtpLoading value) optLoading,
    required TResult Function(SetupEntityError value) optError,
    required TResult Function(SetupEntityVerificationError value)
        optVerificationError,
    required TResult Function(OtpVerifiedSuccessState value) optVerifiedSuccess,
    required TResult Function(OtpRequestSuccessState value) optRequestSuccess,
    required TResult Function(ProfileUpdateSuccessState value)
        profileUpdateSuccess,
    required TResult Function(CodeResentSuccessState value) codeResentSuccess,
  }) {
    return optRequestSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtpInit value)? init,
    TResult? Function(OtpLoading value)? optLoading,
    TResult? Function(SetupEntityError value)? optError,
    TResult? Function(SetupEntityVerificationError value)? optVerificationError,
    TResult? Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult? Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult? Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult? Function(CodeResentSuccessState value)? codeResentSuccess,
  }) {
    return optRequestSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtpInit value)? init,
    TResult Function(OtpLoading value)? optLoading,
    TResult Function(SetupEntityError value)? optError,
    TResult Function(SetupEntityVerificationError value)? optVerificationError,
    TResult Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult Function(CodeResentSuccessState value)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (optRequestSuccess != null) {
      return optRequestSuccess(this);
    }
    return orElse();
  }
}

abstract class OtpRequestSuccessState implements OtpState {
  const factory OtpRequestSuccessState(final SendOtpEntity entity) =
      _$OtpRequestSuccessStateImpl;

  SendOtpEntity get entity;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpRequestSuccessStateImplCopyWith<_$OtpRequestSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileUpdateSuccessStateImplCopyWith<$Res> {
  factory _$$ProfileUpdateSuccessStateImplCopyWith(
          _$ProfileUpdateSuccessStateImpl value,
          $Res Function(_$ProfileUpdateSuccessStateImpl) then) =
      __$$ProfileUpdateSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileUpdateSuccessStateImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$ProfileUpdateSuccessStateImpl>
    implements _$$ProfileUpdateSuccessStateImplCopyWith<$Res> {
  __$$ProfileUpdateSuccessStateImplCopyWithImpl(
      _$ProfileUpdateSuccessStateImpl _value,
      $Res Function(_$ProfileUpdateSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileUpdateSuccessStateImpl implements ProfileUpdateSuccessState {
  const _$ProfileUpdateSuccessStateImpl();

  @override
  String toString() {
    return 'OtpState.profileUpdateSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileUpdateSuccessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() optLoading,
    required TResult Function(AppErrors error, VoidCallback callback) optError,
    required TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)
        optVerificationError,
    required TResult Function(ValidateOtpEntity entity, VerificationType type)
        optVerifiedSuccess,
    required TResult Function(SendOtpEntity entity) optRequestSuccess,
    required TResult Function() profileUpdateSuccess,
    required TResult Function(SendOtpEntity entity) codeResentSuccess,
  }) {
    return profileUpdateSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? optLoading,
    TResult? Function(AppErrors error, VoidCallback callback)? optError,
    TResult? Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult? Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult? Function(SendOtpEntity entity)? optRequestSuccess,
    TResult? Function()? profileUpdateSuccess,
    TResult? Function(SendOtpEntity entity)? codeResentSuccess,
  }) {
    return profileUpdateSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? optLoading,
    TResult Function(AppErrors error, VoidCallback callback)? optError,
    TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult Function(SendOtpEntity entity)? optRequestSuccess,
    TResult Function()? profileUpdateSuccess,
    TResult Function(SendOtpEntity entity)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (profileUpdateSuccess != null) {
      return profileUpdateSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtpInit value) init,
    required TResult Function(OtpLoading value) optLoading,
    required TResult Function(SetupEntityError value) optError,
    required TResult Function(SetupEntityVerificationError value)
        optVerificationError,
    required TResult Function(OtpVerifiedSuccessState value) optVerifiedSuccess,
    required TResult Function(OtpRequestSuccessState value) optRequestSuccess,
    required TResult Function(ProfileUpdateSuccessState value)
        profileUpdateSuccess,
    required TResult Function(CodeResentSuccessState value) codeResentSuccess,
  }) {
    return profileUpdateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtpInit value)? init,
    TResult? Function(OtpLoading value)? optLoading,
    TResult? Function(SetupEntityError value)? optError,
    TResult? Function(SetupEntityVerificationError value)? optVerificationError,
    TResult? Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult? Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult? Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult? Function(CodeResentSuccessState value)? codeResentSuccess,
  }) {
    return profileUpdateSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtpInit value)? init,
    TResult Function(OtpLoading value)? optLoading,
    TResult Function(SetupEntityError value)? optError,
    TResult Function(SetupEntityVerificationError value)? optVerificationError,
    TResult Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult Function(CodeResentSuccessState value)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (profileUpdateSuccess != null) {
      return profileUpdateSuccess(this);
    }
    return orElse();
  }
}

abstract class ProfileUpdateSuccessState implements OtpState {
  const factory ProfileUpdateSuccessState() = _$ProfileUpdateSuccessStateImpl;
}

/// @nodoc
abstract class _$$CodeResentSuccessStateImplCopyWith<$Res> {
  factory _$$CodeResentSuccessStateImplCopyWith(
          _$CodeResentSuccessStateImpl value,
          $Res Function(_$CodeResentSuccessStateImpl) then) =
      __$$CodeResentSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SendOtpEntity entity});
}

/// @nodoc
class __$$CodeResentSuccessStateImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$CodeResentSuccessStateImpl>
    implements _$$CodeResentSuccessStateImplCopyWith<$Res> {
  __$$CodeResentSuccessStateImplCopyWithImpl(
      _$CodeResentSuccessStateImpl _value,
      $Res Function(_$CodeResentSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
  }) {
    return _then(_$CodeResentSuccessStateImpl(
      null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as SendOtpEntity,
    ));
  }
}

/// @nodoc

class _$CodeResentSuccessStateImpl implements CodeResentSuccessState {
  const _$CodeResentSuccessStateImpl(this.entity);

  @override
  final SendOtpEntity entity;

  @override
  String toString() {
    return 'OtpState.codeResentSuccess(entity: $entity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CodeResentSuccessStateImpl &&
            (identical(other.entity, entity) || other.entity == entity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entity);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CodeResentSuccessStateImplCopyWith<_$CodeResentSuccessStateImpl>
      get copyWith => __$$CodeResentSuccessStateImplCopyWithImpl<
          _$CodeResentSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() optLoading,
    required TResult Function(AppErrors error, VoidCallback callback) optError,
    required TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)
        optVerificationError,
    required TResult Function(ValidateOtpEntity entity, VerificationType type)
        optVerifiedSuccess,
    required TResult Function(SendOtpEntity entity) optRequestSuccess,
    required TResult Function() profileUpdateSuccess,
    required TResult Function(SendOtpEntity entity) codeResentSuccess,
  }) {
    return codeResentSuccess(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? optLoading,
    TResult? Function(AppErrors error, VoidCallback callback)? optError,
    TResult? Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult? Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult? Function(SendOtpEntity entity)? optRequestSuccess,
    TResult? Function()? profileUpdateSuccess,
    TResult? Function(SendOtpEntity entity)? codeResentSuccess,
  }) {
    return codeResentSuccess?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? optLoading,
    TResult Function(AppErrors error, VoidCallback callback)? optError,
    TResult Function(
            AppErrors error, VoidCallback callback, VerificationType type)?
        optVerificationError,
    TResult Function(ValidateOtpEntity entity, VerificationType type)?
        optVerifiedSuccess,
    TResult Function(SendOtpEntity entity)? optRequestSuccess,
    TResult Function()? profileUpdateSuccess,
    TResult Function(SendOtpEntity entity)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (codeResentSuccess != null) {
      return codeResentSuccess(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtpInit value) init,
    required TResult Function(OtpLoading value) optLoading,
    required TResult Function(SetupEntityError value) optError,
    required TResult Function(SetupEntityVerificationError value)
        optVerificationError,
    required TResult Function(OtpVerifiedSuccessState value) optVerifiedSuccess,
    required TResult Function(OtpRequestSuccessState value) optRequestSuccess,
    required TResult Function(ProfileUpdateSuccessState value)
        profileUpdateSuccess,
    required TResult Function(CodeResentSuccessState value) codeResentSuccess,
  }) {
    return codeResentSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtpInit value)? init,
    TResult? Function(OtpLoading value)? optLoading,
    TResult? Function(SetupEntityError value)? optError,
    TResult? Function(SetupEntityVerificationError value)? optVerificationError,
    TResult? Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult? Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult? Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult? Function(CodeResentSuccessState value)? codeResentSuccess,
  }) {
    return codeResentSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtpInit value)? init,
    TResult Function(OtpLoading value)? optLoading,
    TResult Function(SetupEntityError value)? optError,
    TResult Function(SetupEntityVerificationError value)? optVerificationError,
    TResult Function(OtpVerifiedSuccessState value)? optVerifiedSuccess,
    TResult Function(OtpRequestSuccessState value)? optRequestSuccess,
    TResult Function(ProfileUpdateSuccessState value)? profileUpdateSuccess,
    TResult Function(CodeResentSuccessState value)? codeResentSuccess,
    required TResult orElse(),
  }) {
    if (codeResentSuccess != null) {
      return codeResentSuccess(this);
    }
    return orElse();
  }
}

abstract class CodeResentSuccessState implements OtpState {
  const factory CodeResentSuccessState(final SendOtpEntity entity) =
      _$CodeResentSuccessStateImpl;

  SendOtpEntity get entity;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CodeResentSuccessStateImplCopyWith<_$CodeResentSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
