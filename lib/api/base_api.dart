import 'package:dio/dio.dart';

class BaseApi {
  final Dio _dio = Dio();
  final _baseUrl = "http://localhost:8000/api/";

  /// GET WEBSITE DATA FROM RESTFUL API LARAVEL
  getDataByLaravelRestAPI(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      Response<dynamic> response = await _dio.get(_baseUrl + url,
          queryParameters: queryParameters,
          options: Options(contentType: 'application/json'));
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  /// POST WEBSITE DATA FROM RESTFUL API LARAVEL
  postDataByLaravelRestAPI(
      {required String url, Map<String, dynamic>? data}) async {
    try {
      Response<dynamic> response = await _dio.post(_baseUrl + url,
          data: data,
          options: Options(contentType: 'application/x-www-form-urlencoded'));
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
  }
}
