import 'package:app/di/injector_provider.dart';
import 'package:app/models/definitions/peripheral_definition.dart';
import 'package:app/models/definitions/quantity_type.dart';
import 'package:app/data/definitions/definitions_api.dart';

class DefinitionsRepository {

  final DefinitionsApi _api = inject<DefinitionsApi>();

  /// List all peripheral device definitions.
  Future<List<PeripheralDefinition>> getPeripheralDefinitions({bool withExpectedQuantityType = true}) async {
    return _api.getPeripheralDefinitions();
  }

  /// List all quantity types.
  Future<List<QuantityType>> getQuantityTypes() async {
      return _api.getQuantityTypes();
  }

}