import 'package:fpdart/fpdart.dart';

class Get{{name.pascalCase()}}Db implements UseCase<{{name.pascalCase()}}?, String> {
  Get{{name.pascalCase()}}Db(this.repository);
  final {{name.pascalCase()}}Repository repository;

  @override
  Future<Either<Failure, {{name.pascalCase()}}?>> call(String id) {
    return repository.get{{name.pascalCase()}}ById(id);
  }
}