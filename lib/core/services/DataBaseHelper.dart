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
    _database = await _initDB('exam_results.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE results (
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

  // Insert a Result
  Future<int> insertResult(ResultModel result) async {
    final db = await database;
    return await db.insert('results', result.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Get all results
  Future<List<ResultModel>> getResults() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('results');
    return maps.map((map) => ResultModel.fromJson(map)).toList();

  }

  // Delete a result
  Future<int> deleteResult(int id) async {
    final db = await database;
    return await db.delete('results', where: 'id = ?', whereArgs: [id]);
  }

  // Close database
  Future close() async {
    final db = await database;
    db.close();
  }
}
