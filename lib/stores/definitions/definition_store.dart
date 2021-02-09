import 'package:app/models/definitions/peripheral_definition.dart';
import 'package:mobx/mobx.dart';
part 'peripheral_store.g.dart';

class PeripheralStore = _PeripheralStore with _$PeripheralStore;

abstract class _PeripheralStore with Store {

  final 

  ObservableList<PeripheralDefinition> peripherals = ObservableList.of([]);

  @action
  void addPeripheral(PeripheralDefinition peripheral) {
    peripherals.add(peripheral);
  }

  @action
  void fetchPeripheralDefinitions() {

  }





}