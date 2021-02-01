import 'package:uri/uri.dart';

class Endpoints {

  /// make class non-instantiable
  Endpoints._();

  static const String baseUrl = 'https://api.astroplant.sda-projects.nl';

  /// The configurations of the specified kit.
  static UriTemplate configurationUrl = UriTemplate(baseUrl + '/kits/{kitSerial}/configurations');


  /// Endpoints to get information about definitions such as quantity types.
  /// List all peripheral device definitions.
  static const String peripheralDefinitionsUrl = baseUrl + '​/peripheral-definitions';
  /// List all quantity types.
  static const String quantityTypesUrl = baseUrl + '/quantity-types';


  /// Authentication and authorization endpoints.
  static const String authInfoUrl = baseUrl + '/me';
  static const String authUrl = baseUrl + '/me/auth';
  static const String authRefreshUrl = baseUrl + '/me/refresh';

}