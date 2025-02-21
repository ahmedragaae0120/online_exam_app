import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/ResultModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@singleton
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  DatabaseHelper();
  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'exam_results.db');
    return await openDatabase(path, version: 1);
  }

  Future<void> createUserTable(String userId) async {
    final db = await database;
    await db.execute('''
      CREATE TABLE IF NOT EXISTS results_$userId (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        examId TEXT UNIQUE,
        message TEXT,
        numOfCorrectAnswers INTEGER,
        studentAnswers TEXT,
        questions TEXT,
        subject TEXT,
        exam TEXT
      )
    ''');
  }

  Future<int> insertResult(String userId, ResultModel result) async {
    final db = await database;
    await createUserTable(userId);
    return await db.insert('results_$userId', result.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ResultModel>> getResults(String userId) async {
    final db = await database;
    await createUserTable(userId);
    final List<Map<String, dynamic>> maps = await db.query('results_$userId');
    return maps.map((map) => ResultModel.fromJson(map)).toList();
  }

  Future<ResultModel?> getResultById(String userId, String examId) async {
    final db = await database;
    await createUserTable(userId);
    final List<Map<String, dynamic>> maps = await db.query(
      'results_$userId',
      where: 'examId = ?',
      whereArgs: [examId],
    );

    if (maps.isNotEmpty) {
      return ResultModel.fromJson(maps.first);
    } else {
      return null;
    }
  }


  Future<int> deleteResult(String userId, int id) async {
    final db = await database;
    return await db.delete('results_$userId', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
