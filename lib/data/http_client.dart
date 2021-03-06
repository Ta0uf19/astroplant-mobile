
import 'package:app/data/endpoints.dart';
import 'package:app/data/auth/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpClient {

  Dio _client;

  HttpClient() {

    _client = Dio();

    _client
      ..options.baseUrl = Endpoints.baseUrl
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8', 'Accept': 'application/json'}
      // ..interceptors.add(LogInterceptor(
      //   request: true,
      //   responseBody: true,
      //   requestBody: true,
      //   requestHeader: true,
      // ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (Options options) async {
            // getting shared pref instance
            var prefs = await SharedPreferences.getInstance();
            var token = prefs.getString('auth_token');
            if(token != null) {
              options.headers['Authorization'] = 'Bearer ' + token;
            }
            return options; //continue
          },
          onError: (DioError error) async {
            if (error.response?.statusCode == 401) {

              var options = error.response.request;
              // Ask new token
              var token = await AuthRepository()
                  .refreshToken();

              if(token != null) {
                options.headers['Authorization'] = 'Bearer ' + token;
              }

              return _client.request(options.path, options: options);
            }
            return error.response;
          }
        ),
      );
  }

  Future<Response> getParams(String url, [Map<String, String> queryParams]) {
    queryParams.removeWhere((key, value) => value == null || value.isEmpty || value == 'null');
    return _client.get(url, queryParameters: queryParams);
  }
  Future<Response> get(String url) => _client.get(url);
  Future<Response> post(String url, { dynamic body }) => _client.post(url, data: body);
  Future<Response> put(String url, { dynamic body }) => _client.put(url, data: body);
  Future<Response> delete(String url, { dynamic body }) => _client.delete(url);
  Future<Response> patch(String url, { dynamic body }) => _client.patch(url, data: body);
}