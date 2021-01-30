import 'package:uri/uri.dart';

class Endpoints {

  // make class non-instantiable
  Endpoints._();

  static const String baseUrl = 'https://api.astroplant.sda-projects.nl';

  /// The configurations of the specified kit.
  static UriTemplate configurationUrl = UriTemplate(baseUrl + '/kits/~{kitSerial}/configurations');

  /// List all peripheral device definitions.
  static const String peripheralDefinitionsUrl = baseUrl + '​/peripheral-definitions';

  /// List all quantity types.
  static const String quantityTypesUrl = baseUrl + '/quantity-types';
}