
import 'package:app/di/injector_provider.dart';
import 'package:app/repositories/auth_repository.dart';
import 'package:app/repositories/kit_configuration_repository.dart';
import 'package:app/repositories/kit_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setupInjection();

  test('getTokens of dtestd', () async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var authRepository = inject<AuthRepository>();
      var kitConfigurationRepository = inject<KitConfigurationRepository>();
      var response = await authRepository.getTokens('dtestd', 'dtestd');
      if(response.accessToken != null)       await prefs.setString('auth_token', response.accessToken);
      print(response.toString());
      var response2 = await kitConfigurationRepository.getConfiguration('k-9pd7-cdkc-cmm7');
      print(response2.toString());
    } catch (e) {
      print(e);
    }

  });

}
