import 'package:dartz/dartz.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';

/// Base class for all use cases.
abstract class UseCase<Type, Params> {
  const UseCase();

  /// Execute the use case with the given parameters.
  Future<Either<Failure, Type>> call(Params params);
}

/// Class to represent no parameters for use cases that don't need any.
class NoParams {
  const NoParams();
}
