
import 'package:app/models/definitions/peripheral_definition.dart';
import 'package:app/models/kit/peripheral.dart';
import 'package:mobx/mobx.dart';
part 'peripheral_store.g.dart';

class PeripheralStore = _PeripheralStore with _$PeripheralStore;

abstract class _PeripheralStore with Store {

  ObservableList<PeripheralDefinitions> peripherals = ObservableList.of([]);

  @action
  void addPeripheral(PeripheralDefinitions peripheral) {
    peripherals.add(peripheral);
  }



}