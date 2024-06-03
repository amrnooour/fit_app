abstract class ApiConsumer {
  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> code(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
}
