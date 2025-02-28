import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/constants.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    init();
  }

  void init() {
    dio = Dio(
      BaseOptions(
          baseUrl: Constants.baseUrl,
          connectTimeout: Duration(seconds: 60),
          headers: {
            "token":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjVjY2YxODZhMDI0ZjA2ZWEyODNiOSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5OTY3NzI5fQ.F6eACGexv_DDgr1e0YKNu0qDqioC5GrdSuLcSU1PdLg"
          }),
    );
  }

  Future<Response> getRequest(
      {required String endPoint,
      Map<String, dynamic>? queryParamters,
      Map<String, dynamic>? headers}) async {
    var response = await dio.get(endPoint,
        queryParameters: queryParamters, options: Options(headers: headers));
    return response;
  }

  Future<Response> postRequest(
      {required String endPoint, Map<String, dynamic>? body}) async {
    var response = await dio.post(endPoint, data: body);
    return response;
  }

  Future<Response> putRequest(
      {required String endPoint, Map<String, dynamic>? body}) async {
    var response = await dio.put(endPoint, data: body);
    return response;
  }
}

// Future<Response> postData(
//       {required String endPoint,
//       Map<String, dynamic>? body,
//       Map<String, dynamic>? headers}) async {
//     return dio.post(AppConstants.baseURL + endPoint,
//         data: body, options: Options(headers: headers));
//   }
