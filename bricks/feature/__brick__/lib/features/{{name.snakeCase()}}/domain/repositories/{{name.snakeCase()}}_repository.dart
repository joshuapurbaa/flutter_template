import 'package:fpdart/fpdart.dart';

abstract interface class {{name.pascalCase()}}Repository {
  Future<Either<Failure, Unit>> delete{{name.pascalCase()}}(String id);
  Future<Either<Failure, {{name.pascalCase()}}?>> get{{name.pascalCase()}}(
    String id,
  );
  Future<Either<Failure, List<{{name.pascalCase()}}>>> getAll{{name.pascalCase()}}();
  Future<Either<Failure, Unit>> insert{{name.pascalCase()}}(
    {{name.pascalCase()}} {{name.camelCase()}},
  );
  Future<Either<Failure, Unit>> update{{name.pascalCase()}}(
    {{name.pascalCase()}} {{name.camelCase()}},
  );
}

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  {{name.pascalCase()}}RepositoryImpl(this.api);

  final {{name.pascalCase()}}DbApi api;
  @override
  Future<Either<Failure, Unit>> delete{{name.pascalCase()}}(String id) async {
    try {
      await api.delete{{name.pascalCase()}}(id);
      return right(unit);
    } on CustomException catch (e) {
      return left(DatabaseFailure('DB Failure: $e'));
    }
  }

  @override
  Future<Either<Failure, List<{{name.pascalCase()}}>>>
      getAll{{name.pascalCase()}}() async {
    try {
      final result = await api.getAll{{name.pascalCase()}}();
      return right(result);
    } on CustomException catch (e) {
      return left(DatabaseFailure('DB Failure: $e'));
    }
  }

  @override
  Future<Either<Failure, {{name.pascalCase()}}?>> get{{name.pascalCase()}}(
    String id,
  ) async {
    try {
      final result = await api.get{{name.pascalCase()}}(id);

      if (result != null) {
        return right(result);
      } else {
        return left(DatabaseFailure('DB Failure: No data found'));
      }
    } on CustomException catch (e) {
      return left(DatabaseFailure('DB Failure: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> insert{{name.pascalCase()}}(
    {{name.pascalCase()}} {{name.camelCase()}},
  ) async {
    try {
      await api.insert{{name.pascalCase()}}({{name.camelCase()}});
      return right(unit);
    } on CustomException catch (e) {
      return left(DatabaseFailure('DB Failure: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> update{{name.pascalCase()}}(
    {{name.pascalCase()}} {{name.camelCase()}},
  ) async {
    try {
      await api.update{{name.pascalCase()}}({{name.camelCase()}});
      return right(unit);
    } on CustomException catch (e) {
      return left(DatabaseFailure('DB Failure: $e'));
    }
  }
}