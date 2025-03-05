import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/services/DataBaseHelper.dart';
import 'package:online_exam_app/core/services/user_service.dart';
import 'package:online_exam_app/data/data_source_contract/GetResultsDataSourceRepo.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: GetResultsDataSourceRepo)
class GetResultsDataSourceRepoImpl implements GetResultsDataSourceRepo {

  final UserService userService = getIt<UserService>();
  final String? userId;

  // this will make only one instance of the user id
  GetResultsDataSourceRepoImpl() : userId = getIt<UserService>().getCurrentUser()?.id;


  @override
  Future<Result<List<ResultModel>>> fetchResults() async {
    try {
      final dbHelper = getIt<DatabaseHelper>(); // Access the singleton instance
      final storedResults = await dbHelper.getResults(userId ?? "");
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

  Future<Result<bool>> addResult(ResultModel result) async {
    try {
      final dbHelper = getIt<DatabaseHelper>(); // Access the singleton instance
      await dbHelper.insertResult(userId ?? "", result);
      print("✅✅✅ Your Exam Added to DB ✅✅✅");
      return Success(true);
    } catch (e) {
      print("Error while adding result: $e ❌");
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<bool>> deleteResult(String id) async {
    try {
      final dbHelper = getIt<DatabaseHelper>();
      int rowsAffected = await dbHelper.deleteResult(userId ?? "", id);

      if (rowsAffected > 0) {
        print("✅✅✅ Exam Deleted from DB ✅✅✅");
        return Success(true);
      } else {
        print("⚠️ No exam found with ID: $id");
        return Error(Exception("No matching exam found"));
      }
    } catch (e) {
      print("❌ Error while deleting result: $e");
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<ResultModel>> getResultById(String examId) async{
    try {
      final dbHelper = getIt<DatabaseHelper>(); // Access the singleton instance
      final storedResult = await dbHelper.getResultById(userId ?? "",examId);
      print("📌${jsonEncode(storedResult)}");
      print("📌 Stored Results in DB:");
      return Success(storedResult);
    } catch (e) {
      return Error(Exception(e));
    }
  }
}
