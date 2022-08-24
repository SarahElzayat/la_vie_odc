import 'package:dio/dio.dart';
import 'package:la_vie_odc/network/local/cache_helper.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lavie.orangedigitalcenteregypt.com/api/v1/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json; charset=utf-8'},

      ),
    );
  }


  static Future<Response> postData(
      {required String path,
      required Map<String, dynamic> data,
      Map<String, dynamic>? query,
      }) async {
    print('@Dio helper');
    return await dio.post(path, data: data, queryParameters: query);
  }

  static Future<Response> getData(
      { Map<String, dynamic>? query, required String path, String? token}) async {
    dio.options.headers = {
      // 'Content-Type': 'application/json; charset=utf-8',
      'Accept' : 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.get(
      path,
      queryParameters: query,
    );
  }
}
