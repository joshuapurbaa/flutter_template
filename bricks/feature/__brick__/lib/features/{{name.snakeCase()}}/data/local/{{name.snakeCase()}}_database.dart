import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class {{name.pascalCase()}}Db {
  factory {{name.pascalCase()}}Db() => _instance;

  {{name.pascalCase()}}Db._();

  static final {{name.pascalCase()}}Db _instance = {{name.pascalCase()}}Db._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), '{{name.snakeCase()}}.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE {{name.pascalCase()}} (
            id TEXT PRIMARY KEY,
            created_at TEXT NOT NULL,
            updated_at TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }

  Future<void> insert{{name.pascalCase()}}(
    {{name.pascalCase()}} {{name.camelCase()}},
  ) async {
    final db = await database;
    await db.insert(
      '{{name.pascalCase()}}',
      {{name.camelCase()}}.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<{{name.pascalCase()}}>> getAll{{name.pascalCase()}}() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('{{name.pascalCase()}}');
    return List.generate(maps.length, (i) {
      return {{name.pascalCase()}}.fromMap(maps[i]);
    });
  }

  Future<{{name.pascalCase()}}?> get{{name.pascalCase()}}(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      '{{name.pascalCase()}}',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return {{name.pascalCase()}}.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<void> update{{name.pascalCase()}}(
    {{name.pascalCase()}} {{name.camelCase()}},
  ) async {
    final db = await database;
    await db.update(
      '{{name.pascalCase()}}',
      {{name.camelCase()}}.toMap(),
      where: 'id = ?',
      whereArgs: [{{name.camelCase()}}.id],
    );
  }

  Future<void> delete{{name.pascalCase()}}(String id) async {
    final db = await database;
    await db.delete(
      '{{name.pascalCase()}}',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAll{{name.pascalCase()}}() async {
    final db = await database;
    await db.delete('{{name.pascalCase()}}');
  }
}
