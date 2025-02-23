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
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      // You may need to recreate user tables dynamically if they exist per user
    });
  }

  Future<void> createUserTable(String userId) async {
    final db = await database;
    await db.execute('''
      CREATE TABLE IF NOT EXISTS results_$userId (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        examId TEXT UNIQUE,  -- Ensure examId is stored as TEXT
        message TEXT,
        numOfCorrectAnswers INTEGER,
        studentAnswers TEXT,  -- Store as JSON string
        questions TEXT,       -- Store as JSON string
        subject TEXT,         -- Store as JSON string
        exam TEXT             -- Store as JSON string
      )
    ''');
  }

  Future<int> insertResult(String userId, ResultModel result) async {
    final db = await database;
    await createUserTable(userId);

    // Serialize complex objects into JSON strings
    final Map<String, dynamic> resultJson = {
      'examId': result.examId,
      'message': result.message,
      'numOfCorrectAnswers': result.numOfCorrectAnswers,
      'studentAnswers': jsonEncode(result.studentAnswers?.map((x) => x.toJson()).toList()),
      'questions': jsonEncode(result.questions?.map((x) => x.toJson()).toList()),
      'subject': jsonEncode(result.subject?.toJson()),
      'exam': jsonEncode(result.exam?.toJson()),
    };

    return await db.insert(
      'results_$userId',
      resultJson,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ResultModel>> getResults(String userId) async {
    final db = await database;
    await createUserTable(userId);

    final List<Map<String, dynamic>> maps = await db.query('results_$userId');

    return maps.map((map) {
      // Deserialize JSON strings back into Dart objects
      return ResultModel(
        examId: map['examId'],
        message: map['message'],
        numOfCorrectAnswers: map['numOfCorrectAnswers'],
        studentAnswers: map['studentAnswers'] != null
            ? List<Answers>.from(
            (jsonDecode(map['studentAnswers']) as List)
                .map((x) => Answers.fromJson(x)))
            : null,
        questions: map['questions'] != null
            ? List<Questions>.from(
            (jsonDecode(map['questions']) as List)
                .map((x) => Questions.fromJson(x)))
            : null,
        subject: map['subject'] != null
            ? Subject.fromJson(jsonDecode(map['subject']))
            : null,
        exam: map['exam'] != null
            ? Exam.fromJson(jsonDecode(map['exam']))
            : null,
      );
    }).toList();
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
      final map = maps.first;

      // Deserialize JSON strings back into Dart objects
      return ResultModel(
        examId: map['examId'],
        message: map['message'],
        numOfCorrectAnswers: map['numOfCorrectAnswers'],
        studentAnswers: map['studentAnswers'] != null
            ? List<Answers>.from(
            (jsonDecode(map['studentAnswers']) as List)
                .map((x) => Answers.fromJson(x)))
            : null,
        questions: map['questions'] != null
            ? List<Questions>.from(
            (jsonDecode(map['questions']) as List)
                .map((x) => Questions.fromJson(x)))
            : null,
        subject: map['subject'] != null
            ? Subject.fromJson(jsonDecode(map['subject']))
            : null,
        exam: map['exam'] != null
            ? Exam.fromJson(jsonDecode(map['exam']))
            : null,
      );
    } else {
      return null;
    }
  }

  Future<int> deleteResult(String userId, String examId) async {
    final db = await database;
    return await db.delete(
      'results_$userId',
      where: 'examId = ?',
      whereArgs: [examId],
    );
  }
  Future close() async {
    final db = await database;
    db.close();
  }
}