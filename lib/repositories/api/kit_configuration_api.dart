import 'package:app/di/http_client.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/kit_configuration.dart';
import 'package:app/repositories/api/endpoints.dart';

class KitConfigurationApi {

  /// injecting dio instance
  final HttpClient _http = inject<HttpClient>();
  ///final KitConfigurationApi kitConfigurationApi = inject<KitConfigurationApi>(param1: 5);

  String _endpoint;
  String kitSerial;

  KitConfigurationApi(String kitSerial) {
    this.kitSerial = kitSerial;

    /// add parameter to the url
    _endpoint = Endpoints.configurationUrl.expand({'kitSerial': kitSerial});
  }

  /// Returns list of configuration of a kit in response
  Future<KitConfiguration> get() async {
    try {
      final res = await _http.get(_endpoint);
      return KitConfiguration.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

}