import 'package:dio/dio.dart';
import 'package:t7mara/core/constants/constant.dart';

class DioProvider {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrl));
  }

  static Future<Response> getData(
      {required String endPoint, Map<String, dynamic>? header}) async {
    return await dio.get(
      endPoint,
      options: Options(headers: header),
    );
  }

  static Future<Response> post(
      {required String endPoint,
      Map<String, dynamic>? header,
      Map<String, dynamic>? data}) async {
    return await dio.post(
      endPoint,
      options: Options(headers: header),
      data: data,
    );
  }

  static Future<Response> put(
      {required String endPoint,
      Map<String, dynamic>? header,
      Map<String, dynamic>? data}) async {
    return await dio.put(endPoint,
        options: Options(headers: header), data: data);
  }
  static Future<Response> delete(
      {required String endPoint,
      Map<String, dynamic>? header,
      Map<String, dynamic>? data}) async {
    return await dio.delete(endPoint,
        options: Options(headers: header), data: data);
  }
}
