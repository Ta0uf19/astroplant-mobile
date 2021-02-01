
import 'package:app/di/injector_provider.dart';
import 'package:app/models/kit/kit_configuration.dart';

import 'api/kits_api.dart';

class KitRepository {

    final KitsApi _api = inject<KitsApi>();

    /// Returns list of configuration of a kit in response
    Future<KitConfiguration> getConfiguration(String kitSerial) async {
        return await _api.getConfiguration(kitSerial);
    }
}