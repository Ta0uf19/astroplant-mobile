import 'package:app/di/injector_provider.dart';
import 'package:app/data/auth/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setupInjection();
  var username = 'dtestd';
  var authRepository = inject<AuthRepository>();

  test('test login & get info & logout', () async {

    await authRepository.login(username, username);

    var userInfo = await authRepository.getInfo();
    expect(userInfo.username, username);

    // logout user
    await authRepository.logout();
    expect(() => authRepository.getInfo(), throwsA(isA<Exception>()));

  });

  test('test expire token case', () async {

    // login
    await authRepository.login(username, username);

    // get info
    var userInfo = await authRepository.getInfo();
    expect(userInfo.username, username);

    // simulate expire token
    var pref = await SharedPreferences.getInstance();
    await pref.setString('auth_token', 'dummy_token');

    var user = await authRepository.getInfo();
    expect(user.username, username);

  });
}
