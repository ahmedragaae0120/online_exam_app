import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/services/token_storage_service.dart';

@singleton
class ApiManager {
  late Dio dio;
  final TokenStorageService tokenStorage;

  ApiManager(this.tokenStorage) {
    init();
  }

  void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://exam.elevateegy.com/",
        connectTimeout: Duration(seconds: 60),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await tokenStorage.getToken();
          print('Using token: $token');
          if (token != null && token.isNotEmpty) {
            // Try different header format
            options.headers = {
              ...options.headers,
              'Authorization': 'Bearer $token',
              // Add token directly as well
              'token': token,
            };
            print('Request URL: ${options.uri}');
            print('Request Headers: ${options.headers}');
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          print('Error Response: ${error.response?.data}');
          print('Error Status Code: ${error.response?.statusCode}');
          print('Error Headers: ${error.response?.headers}');
          if (error.response?.statusCode == 401) {
            await tokenStorage.clearToken();
          }
          return handler.next(error);
        },
        onResponse: (response, handler) {
          print('Response Status: ${response.statusCode}');
          print('Response Data: ${response.data}');
          print('Response Headers: ${response.headers}');
          return handler.next(response);
        },
      ),
    );
  }

  Future<Response> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await dio.get(
      endPoint,
      queryParameters: queryParameters,
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
}

// Future<Response> postData(
//       {required String endPoint,
//       Map<String, dynamic>? body,
//       Map<String, dynamic>? headers}) async {
//     return dio.post(AppConstants.baseURL + endPoint,
//         data: body, options: Options(headers: headers));
//   }
