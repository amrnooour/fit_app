import 'package:dio/dio.dart';
import 'package:fit_app/core/api/api_consumer.dart';
import 'package:fit_app/core/utils/constsnts.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = Constants.baseUrl;
  }

  @override
  Future post(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }
  
  @override
  Future code(String path, {Object? data, Map<String, dynamic>? queryParameters}) async{
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }
}
