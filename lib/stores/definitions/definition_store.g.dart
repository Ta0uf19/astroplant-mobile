// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'definition_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DefinitionStore on _DefinitionStore, Store {
  Computed<bool> _$hasResultsComputed;

  @override
  bool get hasResults =>
      (_$hasResultsComputed ??= Computed<bool>(() => super.hasResults,
              name: '_DefinitionStore.hasResults'))
          .value;

  final _$mapPeripheralsAtom = Atom(name: '_DefinitionStore.mapPeripherals');

  @override
  ObservableMap<int, PeripheralDefinition> get mapPeripherals {
    _$mapPeripheralsAtom.reportRead();
    return super.mapPeripherals;
  }

  @override
  set mapPeripherals(ObservableMap<int, PeripheralDefinition> value) {
    _$mapPeripheralsAtom.reportWrite(value, super.mapPeripherals, () {
      super.mapPeripherals = value;
    });
  }

  final _$mapQuantityTypesAtom =
      Atom(name: '_DefinitionStore.mapQuantityTypes');

  @override
  ObservableMap<int, QuantityType> get mapQuantityTypes {
    _$mapQuantityTypesAtom.reportRead();
    return super.mapQuantityTypes;
  }

  @override
  set mapQuantityTypes(ObservableMap<int, QuantityType> value) {
    _$mapQuantityTypesAtom.reportWrite(value, super.mapQuantityTypes, () {
      super.mapQuantityTypes = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_DefinitionStore.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
mapPeripherals: ${mapPeripherals},
mapQuantityTypes: ${mapQuantityTypes},
hasResults: ${hasResults}
    ''';
  }
}
