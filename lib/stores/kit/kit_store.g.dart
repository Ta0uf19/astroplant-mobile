// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$KitStore on _KitStore, Store {
  Computed<bool> _$hasResultsComputed;

  @override
  bool get hasResults => (_$hasResultsComputed ??=
          Computed<bool>(() => super.hasResults, name: '_KitStore.hasResults'))
      .value;
  Computed<KitConfiguration> _$activeConfigurationComputed;

  @override
  KitConfiguration get activeConfiguration => (_$activeConfigurationComputed ??=
          Computed<KitConfiguration>(() => super.activeConfiguration,
              name: '_KitStore.activeConfiguration'))
      .value;

  final _$serialAtom = Atom(name: '_KitStore.serial');

  @override
  String get serial {
    _$serialAtom.reportRead();
    return super.serial;
  }

  @override
  set serial(String value) {
    _$serialAtom.reportWrite(value, super.serial, () {
      super.serial = value;
    });
  }

  final _$configurationsFutureAtom =
      Atom(name: '_KitStore.configurationsFuture');

  @override
  ObservableFuture<List<KitConfiguration>> get configurationsFuture {
    _$configurationsFutureAtom.reportRead();
    return super.configurationsFuture;
  }

  @override
  set configurationsFuture(ObservableFuture<List<KitConfiguration>> value) {
    _$configurationsFutureAtom.reportWrite(value, super.configurationsFuture,
        () {
      super.configurationsFuture = value;
    });
  }

  final _$configurationsAtom = Atom(name: '_KitStore.configurations');

  @override
  List<KitConfiguration> get configurations {
    _$configurationsAtom.reportRead();
    return super.configurations;
  }

  @override
  set configurations(List<KitConfiguration> value) {
    _$configurationsAtom.reportWrite(value, super.configurations, () {
      super.configurations = value;
    });
  }

  final _$rawMeasurementsAtom = Atom(name: '_KitStore.rawMeasurements');

  @override
  List<RawMeasurement> get rawMeasurements {
    _$rawMeasurementsAtom.reportRead();
    return super.rawMeasurements;
  }

  @override
  set rawMeasurements(List<RawMeasurement> value) {
    _$rawMeasurementsAtom.reportWrite(value, super.rawMeasurements, () {
      super.rawMeasurements = value;
    });
  }

  final _$_KitStoreActionController = ActionController(name: '_KitStore');

  @override
  Future<dynamic> fetchConfigurations() {
    final _$actionInfo = _$_KitStoreActionController.startAction(
        name: '_KitStore.fetchConfigurations');
    try {
      return super.fetchConfigurations();
    } finally {
      _$_KitStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
serial: ${serial},
configurationsFuture: ${configurationsFuture},
configurations: ${configurations},
rawMeasurements: ${rawMeasurements},
hasResults: ${hasResults},
activeConfiguration: ${activeConfiguration}
    ''';
  }
}
