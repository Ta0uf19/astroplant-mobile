import 'package:app/di/http_client.dart';
import 'package:app/repositories/auth_repository.dart';
import 'package:app/repositories/kit_configuration_repository.dart';
import 'package:app/repositories/kit_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {

  /// A singleton dio provider.
  /// Calling it multiple times will return the same instance.
  inject.registerSingleton(HttpClient());

  // Repositories
  inject.registerFactory(() => KitRepository());
  inject.registerFactory(() => AuthRepository());
  inject.registerFactory(() => KitConfigurationRepository());

}