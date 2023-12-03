// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'widget_union.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WidgetUnion {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ToDoWidget toDoWidget) toDo,
    required TResult Function(WalletWidget walletWidget) wallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ToDoWidget toDoWidget)? toDo,
    TResult? Function(WalletWidget walletWidget)? wallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ToDoWidget toDoWidget)? toDo,
    TResult Function(WalletWidget walletWidget)? wallet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnionToDo value) toDo,
    required TResult Function(UnionWallet value) wallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnionToDo value)? toDo,
    TResult? Function(UnionWallet value)? wallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnionToDo value)? toDo,
    TResult Function(UnionWallet value)? wallet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WidgetUnionCopyWith<$Res> {
  factory $WidgetUnionCopyWith(
          WidgetUnion value, $Res Function(WidgetUnion) then) =
      _$WidgetUnionCopyWithImpl<$Res, WidgetUnion>;
}

/// @nodoc
class _$WidgetUnionCopyWithImpl<$Res, $Val extends WidgetUnion>
    implements $WidgetUnionCopyWith<$Res> {
  _$WidgetUnionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnionToDoImplCopyWith<$Res> {
  factory _$$UnionToDoImplCopyWith(
          _$UnionToDoImpl value, $Res Function(_$UnionToDoImpl) then) =
      __$$UnionToDoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ToDoWidget toDoWidget});

  $ToDoWidgetCopyWith<$Res> get toDoWidget;
}

/// @nodoc
class __$$UnionToDoImplCopyWithImpl<$Res>
    extends _$WidgetUnionCopyWithImpl<$Res, _$UnionToDoImpl>
    implements _$$UnionToDoImplCopyWith<$Res> {
  __$$UnionToDoImplCopyWithImpl(
      _$UnionToDoImpl _value, $Res Function(_$UnionToDoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toDoWidget = null,
  }) {
    return _then(_$UnionToDoImpl(
      null == toDoWidget
          ? _value.toDoWidget
          : toDoWidget // ignore: cast_nullable_to_non_nullable
              as ToDoWidget,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ToDoWidgetCopyWith<$Res> get toDoWidget {
    return $ToDoWidgetCopyWith<$Res>(_value.toDoWidget, (value) {
      return _then(_value.copyWith(toDoWidget: value));
    });
  }
}

/// @nodoc

class _$UnionToDoImpl implements UnionToDo {
  const _$UnionToDoImpl(this.toDoWidget);

  @override
  final ToDoWidget toDoWidget;

  @override
  String toString() {
    return 'WidgetUnion.toDo(toDoWidget: $toDoWidget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnionToDoImpl &&
            (identical(other.toDoWidget, toDoWidget) ||
                other.toDoWidget == toDoWidget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, toDoWidget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnionToDoImplCopyWith<_$UnionToDoImpl> get copyWith =>
      __$$UnionToDoImplCopyWithImpl<_$UnionToDoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ToDoWidget toDoWidget) toDo,
    required TResult Function(WalletWidget walletWidget) wallet,
  }) {
    return toDo(toDoWidget);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ToDoWidget toDoWidget)? toDo,
    TResult? Function(WalletWidget walletWidget)? wallet,
  }) {
    return toDo?.call(toDoWidget);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ToDoWidget toDoWidget)? toDo,
    TResult Function(WalletWidget walletWidget)? wallet,
    required TResult orElse(),
  }) {
    if (toDo != null) {
      return toDo(toDoWidget);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnionToDo value) toDo,
    required TResult Function(UnionWallet value) wallet,
  }) {
    return toDo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnionToDo value)? toDo,
    TResult? Function(UnionWallet value)? wallet,
  }) {
    return toDo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnionToDo value)? toDo,
    TResult Function(UnionWallet value)? wallet,
    required TResult orElse(),
  }) {
    if (toDo != null) {
      return toDo(this);
    }
    return orElse();
  }
}

abstract class UnionToDo implements WidgetUnion {
  const factory UnionToDo(final ToDoWidget toDoWidget) = _$UnionToDoImpl;

  ToDoWidget get toDoWidget;
  @JsonKey(ignore: true)
  _$$UnionToDoImplCopyWith<_$UnionToDoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnionWalletImplCopyWith<$Res> {
  factory _$$UnionWalletImplCopyWith(
          _$UnionWalletImpl value, $Res Function(_$UnionWalletImpl) then) =
      __$$UnionWalletImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WalletWidget walletWidget});

  $WalletWidgetCopyWith<$Res> get walletWidget;
}

/// @nodoc
class __$$UnionWalletImplCopyWithImpl<$Res>
    extends _$WidgetUnionCopyWithImpl<$Res, _$UnionWalletImpl>
    implements _$$UnionWalletImplCopyWith<$Res> {
  __$$UnionWalletImplCopyWithImpl(
      _$UnionWalletImpl _value, $Res Function(_$UnionWalletImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletWidget = null,
  }) {
    return _then(_$UnionWalletImpl(
      null == walletWidget
          ? _value.walletWidget
          : walletWidget // ignore: cast_nullable_to_non_nullable
              as WalletWidget,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletWidgetCopyWith<$Res> get walletWidget {
    return $WalletWidgetCopyWith<$Res>(_value.walletWidget, (value) {
      return _then(_value.copyWith(walletWidget: value));
    });
  }
}

/// @nodoc

class _$UnionWalletImpl implements UnionWallet {
  const _$UnionWalletImpl(this.walletWidget);

  @override
  final WalletWidget walletWidget;

  @override
  String toString() {
    return 'WidgetUnion.wallet(walletWidget: $walletWidget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnionWalletImpl &&
            (identical(other.walletWidget, walletWidget) ||
                other.walletWidget == walletWidget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, walletWidget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnionWalletImplCopyWith<_$UnionWalletImpl> get copyWith =>
      __$$UnionWalletImplCopyWithImpl<_$UnionWalletImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ToDoWidget toDoWidget) toDo,
    required TResult Function(WalletWidget walletWidget) wallet,
  }) {
    return wallet(walletWidget);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ToDoWidget toDoWidget)? toDo,
    TResult? Function(WalletWidget walletWidget)? wallet,
  }) {
    return wallet?.call(walletWidget);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ToDoWidget toDoWidget)? toDo,
    TResult Function(WalletWidget walletWidget)? wallet,
    required TResult orElse(),
  }) {
    if (wallet != null) {
      return wallet(walletWidget);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnionToDo value) toDo,
    required TResult Function(UnionWallet value) wallet,
  }) {
    return wallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnionToDo value)? toDo,
    TResult? Function(UnionWallet value)? wallet,
  }) {
    return wallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnionToDo value)? toDo,
    TResult Function(UnionWallet value)? wallet,
    required TResult orElse(),
  }) {
    if (wallet != null) {
      return wallet(this);
    }
    return orElse();
  }
}

abstract class UnionWallet implements WidgetUnion {
  const factory UnionWallet(final WalletWidget walletWidget) =
      _$UnionWalletImpl;

  WalletWidget get walletWidget;
  @JsonKey(ignore: true)
  _$$UnionWalletImplCopyWith<_$UnionWalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
