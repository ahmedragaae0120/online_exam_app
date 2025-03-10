import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/services/DataBaseHelper.dart';
import 'package:online_exam_app/data/data_source_contract/Results/GetResultsByIdRepo.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: GetResultsByIdDataSourceRepo)
class GetResultsByIdDataSourceRepoImpl implements GetResultsByIdDataSourceRepo {
  @factoryMethod
  GetResultsByIdDataSourceRepoImpl();

  @override
  Future<Result<ResultModel>> getResultById(String examId) async {
    try {
      final dbHelper = getIt<DatabaseHelper>(); // Access the singleton instance
      final storedResult = await dbHelper.getResultById(examId);
      print("📌${jsonEncode(storedResult)}");
      print("📌 Stored Results in DB:");
      return Success(storedResult);
    } catch (e) {
      return Error(Exception(e));
    }
  }
}
