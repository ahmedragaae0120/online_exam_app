import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'token_storage_service.dart';

@singleton
class DatabaseHelper {
  static Database? _database;
  final TokenStorageService _tokenStorageService;
  late String userId;

  @factoryMethod
  DatabaseHelper(this._tokenStorageService);

  /// Returns the database instance, initializing it if necessary.
  Future<Database> get database async {
    userId = (await _tokenStorageService.getUserId()) ?? "";
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  /// Initializes the SQLite database and returns the instance.
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'exam_results.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  /// Callback function to handle database creation.
  Future<void> _onCreate(Database db, int version) async {
    // No need to create tables here; they are created dynamically per user
  }

  /// Creates a table for storing exam results for a specific user.
  Future<void> createUserTable() async {
    String? userId = await _tokenStorageService.getUserId();
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

  /// Inserts an exam result for a specific user.
  Future<int> insertResult(ResultModel result) async {
    final db = await database;
    await createUserTable();

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

  /// Retrieves all exam results for a specific user.
  Future<List<ResultModel>> getResults() async {
    final db = await database;
    await createUserTable();

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

  /// Retrieves a specific exam result by its ID for a given user.
  Future<ResultModel?> getResultById(String examId) async {
    final db = await database;
    await createUserTable();

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

  /// Deletes an exam result by its ID for a given user.
  Future<int> deleteResult(String examId) async {
    final db = await database;
    return await db.delete(
      'results_$userId',
      where: 'examId = ?',
      whereArgs: [examId],
    );
  }

  /// Closes the database connection.
  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
