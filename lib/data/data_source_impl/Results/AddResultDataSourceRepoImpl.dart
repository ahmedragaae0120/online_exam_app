import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/services/DataBaseHelper.dart';
import 'package:online_exam_app/data/data_source_contract/Results/AddResultRepo.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: AddResultDataSourceRepo)
class AddResultDataSourceRepoImpl implements AddResultDataSourceRepo {
  @factoryMethod
  AddResultDataSourceRepoImpl();

  @override
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
