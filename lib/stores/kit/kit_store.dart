import 'package:app/data/kit/kit_repository.dart';
import 'package:app/data/kit/kit_ws.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/kit/aggregate_measurement.dart';
import 'package:app/models/kit/kit_configuration.dart';
import 'package:app/models/kit/raw_measurement.dart';
import 'package:app/stores/definitions/definition_store.dart';
import 'package:mobx/mobx.dart';

part 'kit_store.g.dart';

class KitStore = _KitStore with _$KitStore;

abstract class _KitStore with Store {
  final DefinitionStore _definitionStore = DefinitionStore();
  final KitRepository _repository = inject<KitRepository>();
  KitWebSocket _kitWs = inject<KitWebSocket>();

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
        {this.configurations = configurations});
    configurationsFuture = ObservableFuture(future);

    return configurationsFuture;
  }

  /// Get active configuration
  @computed
  KitConfiguration get activeConfiguration =>
      configurations.where((element) => element.active == true).first;

  /// Fetch raw measurements
  Future<List<RawMeasurement>> fetchRawMeasurements() async {
    await _definitionStore.init();

    rawMeasurements = activeConfiguration.peripherals
        .expand((peripheral) => {
              _definitionStore.mapPeripherals[peripheral.peripheralDefinitionId]
                  .expectedQuantityTypes
                  .expand((quantityId) => {
                        RawMeasurement(
                            kitSerial: serial,
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

  /// Get aggregate measurements made by a kit.
  Future<List<AggregateMeasurement>> fetchAggregateMeasurements(
      int peripheralId, int quantityTypeId) {
    return _repository.aggregateMeasurements(serial,
        peripheralId: peripheralId, quantityTypeId: peripheralId);
  }

  /// Get streams raw measurements in real time
  Stream<RawMeasurement> getStreamMeasurements() {
    // subscribe to stream of measurements
    _kitWs.subscribeMeasurements(serial);

    return _kitWs.getStreamMeasurements();
  }

  /// Close stream of measurements
  void closeStreamMeasurements() {
    _kitWs.close();

    // create new instance of kit websocket
    _kitWs = inject<KitWebSocket>();
  }

  @action
  Future<bool> activateConfiguration(int index) async {
    var indexActive =
        configurations.indexWhere((element) => element.active == true);
    try {
      if (indexActive != -1) configurations[indexActive].active = false;
      configurations[index].active = true;

      await ObservableFuture(_repository
          .updateConfiguration(configurations[index].id, active: true));

      configurations[index].neverUsed = false;

      return true;
    } on Exception catch (e) {
      if (indexActive != -1) configurations[indexActive].active = true;
      configurations[index].active = false;

      print(e.toString());
      return false;
    }
  }

  @action
  Future<bool> deactivateConfiguration(int index) async {
    var indexActive =
        configurations.indexWhere((element) => element.active == true);
    try {
      configurations[indexActive].active = false;
      await ObservableFuture(_repository
          .updateConfiguration(configurations[index].id, active: false));

      return true;
    } on Exception catch (e) {
      configurations[indexActive].active = true;

      print(e.toString());
      return false;
    }
  }

  @action
  Future<KitConfiguration> addConfiguration(String description) async {
   try {
      var configuration = await ObservableFuture(_repository
          .addConfiguration(description,serial));

      configuration != null
          ? configurations.add(configuration)
          : print('store : add configuration error');

      print(configurations.length);
      return configuration;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}
