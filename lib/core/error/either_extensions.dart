import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';

/// Extension methods for Either<Failure, T> to simplify error handling
extension EitherExtensions<L, R> on Either<L, R> {
  /// Get the right value (success case)
  R getRight() => (this as Right<L, R>).value;

  /// Get the left value (failure case)
  L getLeft() => (this as Left<L, R>).value;

  /// Check if this is a right (success) value
  bool get isRight => this is Right<L, R>;

  /// Check if this is a left (failure) value
  bool get isLeft => this is Left<L, R>;

  /// Map the right value to a new type
  Either<L, T> mapRight<T>(T Function(R r) f) {
    return fold((l) => Left(l), (r) => Right(f(r)));
  }

  /// Map the left value to a new type
  Either<T, R> mapLeft<T>(T Function(L l) f) {
    return fold((l) => Left(f(l)), (r) => Right(r));
  }

  /// Chain operations that can fail
  Either<L, T> flatMap<T>(Either<L, T> Function(R r) f) {
    return fold((l) => Left(l), (r) => f(r));
  }

  /// Execute different functions based on success/failure
  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight) {
    if (this is Left<L, R>) {
      return onLeft(getLeft());
    } else {
      return onRight(getRight());
    }
  }

  /// Get the right value or a default value
  R getOrElse(R Function() defaultValue) {
    return fold((_) => defaultValue(), (r) => r);
  }

  /// Get the right value or throw an exception
  R getOrThrow() {
    return fold(
      (l) => throw Exception('Expected Right but got Left: $l'),
      (r) => r,
    );
  }
}

/// Extension for Either<Failure, T> specifically for UI handling
extension EitherFailureExtensions<T> on Either<Failure, T> {
  /// Convert Either to a Widget based on success/failure
  Widget when({
    required Widget Function(Failure failure) failure,
    required Widget Function(T data) success,
  }) {
    return fold((l) => failure(l), (r) => success(r));
  }

  /// Convert Either to a Widget with loading state
  Widget whenWithLoading({
    required Widget Function() loading,
    required Widget Function(Failure failure) failure,
    required Widget Function(T data) success,
  }) {
    return fold((l) => failure(l), (r) => success(r));
  }
}

/// Extension for handling multiple Either operations
extension EitherListExtensions<L, R> on List<Either<L, R>> {
  /// Collect all right values, return left if any left exists
  Either<L, List<R>> sequence() {
    final rights = <R>[];
    for (final either in this) {
      if (either is Left<L, R>) {
        return Left(either.getLeft());
      } else {
        rights.add(either.getRight());
      }
    }
    return Right(rights);
  }

  /// Partition the list into lefts and rights
  (List<L>, List<R>) partition() {
    final lefts = <L>[];
    final rights = <R>[];
    for (final either in this) {
      if (either is Left<L, R>) {
        lefts.add(either.getLeft());
      } else {
        rights.add(either.getRight());
      }
    }
    return (lefts, rights);
  }
}
