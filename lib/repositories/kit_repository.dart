
import 'package:app/di/injector_provider.dart';
import 'package:app/models/kit/kit_configuration.dart';

import 'api/kit_api.dart';

class KitRepository {

    final KitApi _api = inject<KitApi>();

    /// Returns list of configuration of a kit in response
    Future<KitConfiguration> getConfiguration(String kitSerial) async {
        return await _api.getConfiguration(kitSerial);
    }
}