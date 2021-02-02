import 'package:app/di/injector_provider.dart';
import 'package:app/repositories/auth_repository.dart';
import 'package:app/repositories/kit_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupInjection();
  var username = 'dtestd';
  var authRepository = inject<AuthRepository>();
  var kitRepository = inject<KitRepository>();

  test('login and get configurations/aggregations for a kit', () async {
    // login
    await authRepository.login(username, username);
    // get configuration
    var kitConfiguration = await kitRepository.getConfigurations(
        'k-9pd7-cdkc-cmm7');
    // get aggregation
    var kitAggregate = await kitRepository.aggregateMeasurements(
        'k-hvcx-p3qg-7dfq', peripheralId: 396, quantityTypeId: 4);

    print(kitConfiguration);
    print(kitAggregate);
  });

}