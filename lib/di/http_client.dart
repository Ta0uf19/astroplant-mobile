
import 'package:app/repositories/api/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpClient {

  Dio _client;

  HttpClient() {

    _client = Dio();

    _client
      ..options.baseUrl = Endpoints.baseUrl
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8', 'Accept': 'application/json'}
      ..interceptors.add(LogInterceptor(request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (Options options) async {
            // getting shared pref instance
            var prefs = await SharedPreferences.getInstance();
            var token = prefs.getString('auth_token');
            options.headers['Authorization'] = 'Bearer ' + token;
          },
          onError: (DioError error) async {
            if (error.response?.statusCode == 403) {
              _client.interceptors.requestLock.lock();
              _client.interceptors.responseLock.lock();
              var options = error.response.request;

              /// send request to api to refresh token you can use repository auth.
              ///
              var token = '';
              options.headers['Authorization'] = 'Bearer ' + token;

              _client.interceptors.requestLock.unlock();
              _client.interceptors.responseLock.unlock();
              return _client.request(options.path, options: options);
            }
          }
        ),
      );
  }

  Future<Response> get(String url) => _client.get(url);
  Future<Response> post(String url, { dynamic body }) => _client.post(url, data: body);
  Future<Response> put(String url, { dynamic body }) => _client.put(url, data: body);
  Future<Response> delete(String url, { dynamic body }) => _client.delete(url);
}