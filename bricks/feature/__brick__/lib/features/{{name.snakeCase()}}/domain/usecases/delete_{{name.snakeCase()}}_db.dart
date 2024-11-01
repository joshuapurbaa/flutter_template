import 'package:fpdart/fpdart.dart';

class Delete{{name.pascalCase()}}Db implements UseCase<Unit, String> {
  Delete{{name.pascalCase()}}Db(this.repository);
  final {{name.pascalCase()}}Repository repository;

  @override
  Future<Either<Failure, Unit>> call(String params) {
    return repository.delete{{name.pascalCase()}}(params);
  }
}