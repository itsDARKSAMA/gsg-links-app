import 'package:dio/dio.dart';
import 'package:mylinks/constants/api.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          receiveDataWhenStatusError: true,
          headers: {
            ApiConstants.headerKey: ApiConstants.headerValue,
          }
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String , dynamic>? query,
    String token='',
  }) async
  {
    dio.options.headers =
    {
      ApiConstants.headerKey: ApiConstants.headerValue,
      ApiConstants.authorizationKey: token,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }


  static Future<Response> postData({
    required String url,
    Map<String , dynamic>? query,
    required Map<String , dynamic>? data,
    String? token='',
  }) async
  {
    dio.options.headers =
    {
      ApiConstants.headerKey: ApiConstants.headerValue,
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
      options: Options(
          headers: {'Authorization': 'Bearer $token'},
          followRedirects: false,
          validateStatus: (status) {
            return status != 500;
          }
      )
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String , dynamic>? query,
    required Map<String , dynamic>? data,
    String? token='',
  }) async
  {
    dio.options.headers =
    {
      ApiConstants.headerKey: ApiConstants.headerValue,
      ApiConstants.authorizationKey: token,
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
      ),
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      ApiConstants.headerKey: ApiConstants.headerValue,
      ApiConstants.authorizationKey: token,
    };
    return dio.delete(
      url,
      queryParameters: query,
      options: Options(
        followRedirects: false,
        validateStatus: (status) => true,
      ),
    );
  }


}

