import 'package:app/di/injector_provider.dart';
import 'package:app/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupInjection();

  test('test login & get info & logout', () async {

    var username = 'dtestd';
    var authRepository = inject<AuthRepository>();
    await authRepository.login(username, username);

    var userInfo = await authRepository.getInfo();
    expect(userInfo.username, username);

    // logout user
    await authRepository.logout();
    expect(() => authRepository.getInfo(), throwsA(isA<Exception>()));

  });

}
