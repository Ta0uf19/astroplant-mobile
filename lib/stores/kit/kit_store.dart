import 'package:app/data/kit/kit_repository.dart';
import 'package:app/data/kit/kit_ws.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/kit/kit_configuration.dart';
import 'package:app/models/kit/raw_measurement.dart';
import 'package:app/stores/definitions/definition_store.dart';
import 'package:mobx/mobx.dart';
part 'kit_store.g.dart';

class KitStore = _KitStore with _$KitStore;

abstract class _KitStore with Store {

  final DefinitionStore _definitionStore = DefinitionStore();
  final KitRepository _repository = inject<KitRepository>();
  final KitWebSocket _kitWs = inject<KitWebSocket>();

  /// Kit information
  @observable
  String serial;

  @observable
  ObservableFuture<List<KitConfiguration>> configurationsFuture;

  /// List all configurations used by this kit
  @observable
  List<KitConfiguration> configurations;


  /// List all measurements used by this kit
  @observable
  List<RawMeasurement> rawMeasurements;


  @computed
  bool get hasResults =>
      configurationsFuture != ObservableFuture.value(null) &&
          configurationsFuture.status == FutureStatus.fulfilled;

  /// Fetch configurations
  @action
  Future fetchConfigurations() {

    final future = _repository.getConfigurations(serial);
    future.then((List<KitConfiguration> configurations) =>
    {
      this.configurations = configurations
    });
    configurationsFuture = ObservableFuture(future);

    return configurationsFuture;
  }

  /// Get active configuration
  @computed
  KitConfiguration get activeConfiguration =>
      configurations
          .where((element) => element.active == true).first;


  /// Fetch raw measurements
  Future<List<RawMeasurement>> fetchRawMeasurements() async {
    await _definitionStore.init();

    rawMeasurements = activeConfiguration.peripherals
        .expand((peripheral) => {
              _definitionStore.mapPeripherals[peripheral.peripheralDefinitionId]
                  .expectedQuantityTypes
                  .expand((quantityId) => {
                        RawMeasurement(
                            title: _definitionStore
                                .mapQuantityTypes[quantityId].physicalQuantity,
                            subtitle: peripheral.name,
                            unitSymbol: _definitionStore
                                .mapQuantityTypes[quantityId]
                                .physicalUnitSymbol,
                            quantityTypeId: quantityId,
                            peripheralId: peripheral.id)
                      })
                  .toList()
            })
        .toList()
        .expand((i) => i)
        .toList();

    return rawMeasurements;
  }

  /// Get streams raw measurements
  Stream<RawMeasurement> getStreamMeasurements() {
    // subscribe to stream of measurements
    _kitWs.subscribeMeasurements(serial);

    return _kitWs.getStreamMeasurements();
  }

}