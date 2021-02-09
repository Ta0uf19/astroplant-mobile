import 'package:app/data/definitions/definitions_repository.dart';
import 'package:app/data/http_client.dart';
import 'package:app/data/kit/kit_repository.dart';
import 'package:app/data/auth/auth_api.dart';
import 'package:app/data/definitions/definitions_api.dart';
import 'package:app/data/kit/kit_ws.dart';
import 'package:app/data/kit/kits_api.dart';
import 'package:app/data/auth/auth_repository.dart';
import 'package:app/stores/definitions/definition_store.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {

  /// A singleton dio provider.
  /// Calling it multiple times will return the same instance.
  inject.registerSingleton(HttpClient());

  /// Stores
  //inject.registerSingletonWithDependencies<DefinitionStore>(() => DefinitionStore(), dependsOn: [DefinitionsRepository, DefinitionsApi, HttpClient]);

  /// Register api
  inject.registerFactory(() => AuthApi());
  inject.registerFactory(() => KitsApi());
  inject.registerFactory(() => DefinitionsApi());
  inject.registerFactory(() => KitWebSocket());

  // Repositories
  inject.registerFactory(() => AuthRepository());
  inject.registerFactory(() => KitRepository());
  inject.registerFactory(() => DefinitionsRepository());
}