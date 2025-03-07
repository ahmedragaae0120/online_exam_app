import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/services/DataBaseHelper.dart';
import 'package:online_exam_app/data/data_source_contract/Results/DeleteResultRepo.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: DeleteResultDataSourceRepo)
class DeleteResultDataSourceRepoImpl implements DeleteResultDataSourceRepo {
  @factoryMethod
  DeleteResultDataSourceRepoImpl();

  @override
  Future<Result<bool>> deleteResult(String id) async {
    try {
      final dbHelper = getIt<DatabaseHelper>();
      int rowsAffected = await dbHelper.deleteResult(id);

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
}
