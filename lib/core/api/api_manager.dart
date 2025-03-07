import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/constants.dart';
import 'package:online_exam_app/core/services/token_storage_service.dart';
import 'package:online_exam_app/core/services/token_storage_service.dart';

@singleton
class ApiManager {
  late Dio dio;
  final TokenStorageService _tokenStorageService;

  ApiManager(this._tokenStorageService) {
    init();
  }

  void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: Duration(seconds: 60),
      ),
    );
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async{
      String? token = await _tokenStorageService.getToken();
      if (token != null) {
        options.headers['token'] = token;
      }
      return handler.next(options);
    }));
  }

  Future<Response> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers
  }) async {
    var response = await dio.get(
      endPoint,
      queryParameters: queryParameters, options: Options(headers: headers)
    );
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

  Future<Response> patchRequest({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    var response = await dio.patch(endPoint, data: body);
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
