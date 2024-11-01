import 'package:fpdart/fpdart.dart';

class Insert{{name.pascalCase()}}Db implements UseCase<Unit, {{name.pascalCase()}}> {
  Insert{{name.pascalCase()}}Db(this.repository);
  final {{name.pascalCase()}}Repository repository;

  @override
  Future<Either<Failure, Unit>> call({{name.pascalCase()}} params) async {
    return repository.insert{{name.pascalCase()}}(params);
  }
}