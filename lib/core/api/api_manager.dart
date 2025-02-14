import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://exam.elevateegy.com/",
        connectTimeout: Duration(seconds: 60),
      ),
    );
  }

  Future<Response> getRequest(
      {required String endPoint, Map<String, dynamic>? queryParamters}) async {
    var response = await dio.get(endPoint, queryParameters: queryParamters);
    return response;
  }

  Future<Response> postRequest(
      {required String endPoint, Map<String, dynamic>? body}) async {
    var response = await dio.post(endPoint, data: body);
    return response;
  }
}
