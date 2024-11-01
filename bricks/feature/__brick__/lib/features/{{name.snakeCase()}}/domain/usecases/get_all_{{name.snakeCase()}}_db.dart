import 'package:fpdart/fpdart.dart';

class GetAll{{name.pascalCase()}}Db implements UseCase<List<{{name.pascalCase()}}>, NoParams> {
  GetAll{{name.pascalCase()}}Db(this.repository);
  final {{name.pascalCase()}}Repository repository;

  @override
  Future<Either<Failure, List<{{name.pascalCase()}}>>> call(NoParams params) {
    return repository.getAll{{name.pascalCase()}}();
  }
}