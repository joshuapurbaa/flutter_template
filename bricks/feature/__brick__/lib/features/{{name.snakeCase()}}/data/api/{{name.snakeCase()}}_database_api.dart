import 'package:fpdart/fpdart.dart';

abstract interface class {{name.pascalCase()}}DbApi {
  Future<Unit> delete{{name.pascalCase()}}(String id);
  Future<{{name.pascalCase()}}?> get{{name.pascalCase()}}(String id);
  Future<List<{{name.pascalCase()}}>> getAll{{name.pascalCase()}}();
  Future<Unit> insert{{name.pascalCase()}}({{name.pascalCase()}} {{name.camelCase()}});
  Future<Unit> update{{name.pascalCase()}}({{name.pascalCase()}} {{name.camelCase()}});
}

class {{name.pascalCase()}}DbApiImpl implements {{name.pascalCase()}}DbApi {
  {{name.pascalCase()}}DbApiImpl(this.{{name.camelCase()}}Db);
  final {{name.pascalCase()}}Db {{name.camelCase()}}Db;

  @override
  Future<Unit> delete{{name.pascalCase()}}(String id) async {
    try {
      await {{name.camelCase()}}Db.database;
      await {{name.camelCase()}}Db.delete{{name.pascalCase()}}(id);
      return unit;
    } catch (e) {
      throw CustomException('Error: $e');
    }
  }

  @override
  Future<List<{{name.pascalCase()}}>> getAll{{name.pascalCase()}}() async {
    try {
      await {{name.camelCase()}}Db.database;
      final result = await {{name.camelCase()}}Db.getAll{{name.pascalCase()}}();

      return result;
    } catch (e) {
      throw CustomException('Error: $e');
    }
  }

  @override
  Future<{{name.pascalCase()}}?> get{{name.pascalCase()}}(String id) async {
    try {
      await {{name.camelCase()}}Db.database;
      final result = await {{name.camelCase()}}Db.get{{name.pascalCase()}}(id);

      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      throw CustomException('Error: $e');
    }
  }

  @override
  Future<Unit> insert{{name.pascalCase()}}(
    {{name.pascalCase()}} {{name.camelCase()}},
  ) async {
    try {
      await {{name.camelCase()}}Db.database;
      await {{name.camelCase()}}Db.insert{{name.pascalCase()}}({{name.camelCase()}});
      return unit;
    } catch (e) {
      throw CustomException('Error: $e');
    }
  }

  @override
  Future<Unit> update{{name.pascalCase()}}(
    {{name.pascalCase()}} {{name.camelCase()}},
  ) async {
    try {
      await {{name.camelCase()}}Db.database;
      await {{name.camelCase()}}Db.update{{name.pascalCase()}}({{name.camelCase()}});
      return unit;
    } catch (e) {
      throw CustomException('Error: $e');
    }
  }
}