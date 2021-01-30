
import 'package:app/repositories/api/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpClient {

  Dio _client;

  HttpClient() {

    _client = Dio();

    _client
      ..options.baseUrl = Endpoints.baseUrl
    // ..options.connectTimeout = Endpoints.connectionTimeout
    // ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (Options options) async {
            // getting shared pref instance
            var prefs = await SharedPreferences.getInstance();

            // getting token
            var token = prefs.getString('auth_token');

            if (token != null) {
              options.headers.putIfAbsent('Authorization', () => token);
            } else {
              print('Auth token is null');
            }
          },
        ),
      );
  }

  Future<Response> get(String url) => _client.get(url);
  Future<Response> post(String url, { dynamic body }) => _client.post(url, data: body);
  Future<Response> put(String url, { dynamic body }) => _client.put(url, data: body);
  Future<Response> delete(String url, { dynamic body }) => _client.delete(url);
}