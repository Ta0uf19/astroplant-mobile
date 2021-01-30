import 'package:app/models/kit_configuration.dart';
import 'package:app/repositories/api/kit_configuration_api.dart';

class KitConfigurationRepository {

  /// Returns list of configuration of a kit in response
  Future<KitConfiguration> getConfiguration(String kitSerial) {
    return KitConfigurationApi(kitSerial).get();
  }

}