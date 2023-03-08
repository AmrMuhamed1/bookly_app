import 'package:dio/dio.dart';

class ApiService {
  final baseurl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endpoints}) async {
    var response = await dio.get('$baseurl$endpoints');
    return response.data;
  }
}
