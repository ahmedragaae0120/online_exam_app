import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/api_endpoints.dart';
import 'package:online_exam_app/core/api/api_excuter.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/data/data_source_contract/questions%20_datasource/questions_datasource_contract.dart';
import 'package:online_exam_app/data/model/questions_response/qestions_result_response/QuestionResultResponse.dart';

import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: QuestionsDatasourceContract)
class QuestionsDatasourceImpl implements QuestionsDatasourceContract {
  @factoryMethod
  ApiManager apiManager;
  QuestionsDatasourceImpl(this.apiManager);
  @override
  Future<Result<QuestionResultResponse>> getQuestions(
    String examId,
  ) {
    return executeApi<QuestionResultResponse>(
      () async {
        var apiResponse = await apiManager.getRequest(
          endPoint: ApiEndpoints.getQuestionsEndpoint,
          queryParamters: {
            "exam": examId,
          },
        );
        QuestionResultResponse response =
        QuestionResultResponse.fromJson(apiResponse.data ?? {});
        return response;
      },
    );
  }

  @override
  Future<Result<QuestionResultResponse>> checkAnswers(
      List<Map<String, dynamic>> answers) {
    return executeApi<QuestionResultResponse>(
      () async {
        var apiResponse = await apiManager.postRequest(
          endPoint: ApiEndpoints.checkAnswersEndpoint,
          body: {
            "answers": answers,
          },
        );
        QuestionResultResponse response =
            QuestionResultResponse.fromJson(apiResponse.data ?? {});
        log(response.correctQuestions.toString());
        return response;
      },
    );
  }
}
