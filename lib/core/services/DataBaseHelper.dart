import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@singleton
class DatabaseHelper {
  static Database? _database;

  @factoryMethod
  DatabaseHelper();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'exam_results.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    // No need to create tables here; they are created dynamically per user
  }

  Future<void> createUserTable(String userId) async {
    final db = await database;
    await db.execute('''
      CREATE TABLE IF NOT EXISTS results_$userId (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        examId TEXT UNIQUE,
        message TEXT,
        studentAnswers TEXT,
        questions TEXT,
        correctQuestions TEXT,
        wrongQuestions TEXT,
        subject TEXT,
        exam TEXT
      )
    ''');
  }

  Future<int> insertResult(String userId, ResultModel result) async {
    final db = await database;
    await createUserTable(userId);

    // Use the toDatabaseJson method from ResultModel
    final Map<String, dynamic> resultJson = result.toJson();

    print(
        "✅✅✅ Result Inserted ✅✅✅\n${const JsonEncoder.withIndent('  ').convert(resultJson)}");

    return await db.insert(
      'results_$userId',
      resultJson,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ResultModel>> getResults(String userId) async {
    final db = await database;
    await createUserTable(userId);

    try {
      final List<Map<String, dynamic>> maps = await db.query('results_$userId');
      return maps
          .map((map) {
            try {
              // Use the fromDatabaseJson method from ResultModel
              return ResultModel.fromJson(map);
            } catch (e) {
              print('Error parsing ResultModel: $e');
              return null;
            }
          })
          .whereType<ResultModel>()
          .toList();
    } catch (e) {
      print('Error fetching results: $e');
      return [];
    }
  }

  Future<ResultModel?> getResultById(String userId, String examId) async {
    final db = await database;
    await createUserTable(userId);

    try {
      final List<Map<String, dynamic>> maps = await db.query(
        'results_$userId',
        where: 'examId = ?',
        whereArgs: [examId],
      );

      if (maps.isNotEmpty) {
        try {
          // Use the fromDatabaseJson method from ResultModel
          return ResultModel.fromJson(maps.first);
        } catch (e) {
          print('Error parsing ResultModel: $e');
          return null;
        }
      }
    } catch (e) {
      print('Error fetching result by ID: $e');
    }

    return null;
  }

  Future<int> deleteResult(String userId, String examId) async {
    final db = await database;
    return await db.delete(
      'results_$userId',
      where: 'examId = ?',
      whereArgs: [examId],
    );
  }



  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
