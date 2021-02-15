import 'package:app/data/auth/auth_repository.dart';
import 'package:app/data/kit/kit_repository.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/data/definitions/definitions_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupInjection();
  var kitRepository = inject<KitRepository>();

  var username = 'dtestd';
  var authRepository = inject<AuthRepository>();


  test('test activate configuration', () async {
    await authRepository.login(username, username);

    var config = await kitRepository.updateConfiguration(128,active: true);

    print(config.toString());

    expect(config, true);

  });

}
