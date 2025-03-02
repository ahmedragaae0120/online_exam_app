import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/api_endpoints.dart';
import 'package:online_exam_app/core/api/api_excuter.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/data/data_source_contract/questions%20_datasource/get_questions_datasource_contract.dart';
import 'package:online_exam_app/data/model/questions_response/question_response.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: GetQuestionsDatasourceContract)
class GetQuestionsDatasourceImpl implements GetQuestionsDatasourceContract {
  @factoryMethod
  ApiManager apiManager;
  GetQuestionsDatasourceImpl(this.apiManager);
  @override
  Future<Result<QuestionResponse>> getQuestions(
    String examId,
  ) {
    return executeApi<QuestionResponse>(
      () async {
        var apiResponse = await apiManager.getRequest(
          endPoint: ApiEndpoints.getQuestionsEndpoint,
          queryParamters: {
            "exam": examId,
          },
        );
        QuestionResponse response =
            QuestionResponse.fromJson(apiResponse.data ?? {});
        // var questionList = response.questions
        //     ?.map(
        //       (question) => question,
        //     )
        //     .toList();
        return response;
      },
    );
  }
}
