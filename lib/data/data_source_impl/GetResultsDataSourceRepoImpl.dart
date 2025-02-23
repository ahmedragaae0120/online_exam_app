import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/services/DataBaseHelper.dart';
import 'package:online_exam_app/data/data_source_contract/GetResultsDataSourceRepo.dart';
import 'package:online_exam_app/data/model/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: GetResultsDataSourceRepo)
class GetResultsDataSourceRepoImpl implements GetResultsDataSourceRepo {
  @override
  Future<Result<List<ResultModel>>> FetchResults(
    String userId,
  ) async {
    try {
      final dbHelper = getIt<DatabaseHelper>(); // Access the singleton instance
      final storedResults = await dbHelper.getResults(userId);
      print("📌${storedResults.length}");
      print("📌 Stored Results in DB:");
      for (var res in storedResults) {
        print("📌 JSON Retrieved: ${jsonEncode(res)}");
        // Convert ResultModel to JSON and print
      }
      return Success(storedResults);
    } catch (e) {
      return Error(Exception(e));
    }
  }

  Future<Result<bool>> addResult(String userId, ResultModel result) async {
    try {
      final dbHelper = getIt<DatabaseHelper>(); // Access the singleton instance
      await dbHelper.insertResult(userId, result);

      print("✅✅✅ Your Exam Added to DB ✅✅✅");
      return Success(true);
    } catch (e) {
      print("Error while adding result: $e ❌");
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<bool>> deleteResult(String userId, String id) async {
    try {
      final dbHelper = getIt<DatabaseHelper>(); // Access the singleton instance
      await dbHelper.deleteResult(userId, id);
      print("✅✅✅Your Exam Deleted from DB ✅✅✅");
      return Success(true);
    } catch (e) {
      print("Error while deleting result: $e ❌");
      return Error(Exception(e));
    }
  }
}
