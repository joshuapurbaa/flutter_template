import 'package:fpdart/fpdart.dart';

class Update{{name.pascalCase()}}Db implements UseCase<Unit, {{name.pascalCase()}}> {
  Update{{name.pascalCase()}}Db(this.repository);
  final {{name.pascalCase()}}Repository repository;

  @override
  Future<Either<Failure, Unit>> call({{name.pascalCase()}} params) async {
    return repository.update{{name.pascalCase()}}(params);
  }
}