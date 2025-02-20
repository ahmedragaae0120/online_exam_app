import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/services/DataBaseHelper.dart';
import 'package:online_exam_app/data/data_source_contract/GetResultsDataSourceRepo.dart';
import 'package:online_exam_app/data/model/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';


@Injectable(as: GetResultsDataSourceRepo)
class GetResultsDataSourceRepoImpl implements GetResultsDataSourceRepo {
  @override
  Future<Result<List<ResultModel>>> FetchResults() async {
    try {
      final dbHelper = getIt<DatabaseHelper>(); // Access the singleton instance
      final storedResults = await dbHelper.getResults();
      print("📌${storedResults.length}");
      print("📌 Stored Results in DB:");
      for (var res in storedResults) {
        print(res.toJson());  // Convert ResultModel to JSON and print
      }
      return Success(storedResults);
    } catch (e) {
      return Error(Exception(e));
    }
  }


  Future<Result<bool>> addResult(ResultModel result) async {
    try {
      final dbHelper = getIt<DatabaseHelper>(); // Access the singleton instance
      await dbHelper.insertResult(result);


      print("✅✅✅ Your Exam Added to DB ✅✅✅");
      return Success(true);
    } catch (e) {
      print("Error while adding result: $e ❌");
      return Error(Exception(e));
    }
  }


}
