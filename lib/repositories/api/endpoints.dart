import 'package:uri/uri.dart';

class Endpoints {

  // make class non-instantiable
  Endpoints._();

  static const String baseUrl = 'https://api.astroplant.sda-projects.nl';
  static UriTemplate configurationUrl = UriTemplate(baseUrl + '/kits/~{kitSerial}/configurations');

}