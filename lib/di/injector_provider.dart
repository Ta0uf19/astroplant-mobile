import 'package:app/data/definitions/definitions_repository.dart';
import 'package:app/data/http_client.dart';
import 'package:app/data/kit/kit_repository.dart';
import 'package:app/data/auth/auth_api.dart';
import 'package:app/data/definitions/definitions_api.dart';
import 'package:app/data/kit/kits_api.dart';
import 'package:app/data/auth/auth_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {

  /// A singleton dio provider.
  /// Calling it multiple times will return the same instance.
  inject.registerSingleton(HttpClient());

  /// Register api
  inject.registerFactory(() => AuthApi());
  inject.registerFactory(() => KitsApi());
  inject.registerFactory(() => DefinitionsApi());

  // Repositories
  inject.registerFactory(() => AuthRepository());
  inject.registerFactory(() => KitRepository());
  inject.registerFactory(() => DefinitionRepository());
}