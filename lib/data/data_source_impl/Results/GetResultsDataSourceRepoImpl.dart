import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/services/DataBaseHelper.dart';
import 'package:online_exam_app/data/data_source_contract/Results/GetResultsDataSourceRepo.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: GetResultsDataSourceRepo)
class GetResultsDataSourceRepoImpl implements GetResultsDataSourceRepo {
  @factoryMethod
  GetResultsDataSourceRepoImpl();

  @override
  Future<Result<List<ResultModel>>> fetchResults() async {
    try {
      final dbHelper = getIt<DatabaseHelper>(); // Access the singleton instance
      final storedResults = await dbHelper.getResults();
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

}
