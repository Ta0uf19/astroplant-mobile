import 'package:app/data/definitions/definitions_repository.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/definitions/peripheral_definition.dart';
import 'package:app/models/definitions/quantity_type.dart';
import 'package:mobx/mobx.dart';
part 'definition_store.g.dart';

class DefinitionStore = _DefinitionStore with _$DefinitionStore;

abstract class _DefinitionStore with Store {

  final DefinitionsRepository _repository = inject<DefinitionsRepository>();

  @observable
  ObservableMap<int, PeripheralDefinition> mapPeripherals = ObservableMap();

  @observable
  ObservableMap<int, QuantityType> mapQuantityTypes = ObservableMap();

  /// Check if we have already fetched definitions
  @computed
  bool get hasResults => mapQuantityTypes.isNotEmpty
      && mapPeripherals.isNotEmpty;

  /// Fetch all definitions
  @action
  Future init() async {

    // Get all definitions
    var peripherals = await _repository.getPeripheralDefinitions();
    var qty = await _repository.getQuantityTypes();

    // State quantity type / peripheral definition in Map
    mapPeripherals.addAll(
        <int, PeripheralDefinition> {
          for (PeripheralDefinition e in peripherals) e.id: e
        }
    );

    mapQuantityTypes.addAll(
        <int, QuantityType>{
          for (QuantityType e in qty) e.id: e
        }
    );
  }
}