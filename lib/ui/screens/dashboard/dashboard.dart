import 'dart:developer';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/kit/raw_measurement.dart';
import 'package:app/stores/kit/kit_store.dart';
import 'package:app/ui/components/cheading_title.dart';
import 'package:app/ui/screens/dashboard/cline_chart.dart';
import 'package:app/ui/widgets/cbutton.dart';
import 'package:app/ui/widgets/ccard_peripheral.dart';
import 'package:app/ui/widgets/ccard_peripheral_loading.dart';
import 'package:app/ui/widgets/cheader.dart';
import 'package:app/ui/widgets/ctoggle_widget.dart';
import 'package:app/ui/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();

  static _DashboardScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<_DashboardScreenState>();
}

class _DashboardScreenState extends State<DashboardScreen> {
  RawMeasurement _selectedMeasurement;

  set selectedMeasurement(RawMeasurement rawMeasurement) =>
      setState(() => _selectedMeasurement = rawMeasurement);

  RawMeasurement get selectedMeasurement => _selectedMeasurement;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var themeData = Theme.of(context);

    return FutureBuilder(
      future: inject.allReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: CColors.black,
            appBar: CHeader.buildAppBarWithCButton(
                context: context, title: 'Dashboard'),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: size.width,
                    padding: EdgeInsets.only(
                        left: CPadding.defaultSidesSmall,
                        right: CPadding.defaultSidesSmall,
                        top: CPadding.defaultSmall),
                    child: Column(
                      children: [
                        CHeadingTitle(title: 'Realtime'),
                        RawMeasurementsDashboard(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CHeadingTitle(
                                title: _selectedMeasurement?.title ?? ''),
                            CToggleWidget(
                              onPressed: (index) {
                                log('button pressed ' + index.toString());
                              },
                              defaultSelectedIndex: 0,
                              spacePadding: 13,
                              children: [
                                CButton(
                                  textStyle: themeData.textTheme.headline3
                                      .copyWith(fontSize: 14),
                                  borderRadius: BorderRadius.circular(5),
                                  text: 'Today',
                                  onPressed: () {
                                    log('pressed 0');
                                  },
                                  disabled: true,
                                ),
                                CButton(
                                  textStyle: themeData.textTheme.headline3
                                      .copyWith(fontSize: 14),
                                  text: 'Week',
                                  onPressed: () {
                                    log('pressed 1');
                                  },
                                  borderRadius: BorderRadius.circular(5),
                                  disabled: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                        CLineChart(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class RawMeasurementsDashboard extends StatefulWidget {
  const RawMeasurementsDashboard({
    Key key,
  }) : super(key: key);

  @override
  _RawMeasurementsDashboardState createState() =>
      _RawMeasurementsDashboardState();
}

class _RawMeasurementsDashboardState extends State<RawMeasurementsDashboard> {

  // final DefinitionStore defStore = DefinitionStore();
  final KitStore kitStore = KitStore();

  final int _defaultSelectedIndex = 0;
  // var kitWebSocket = inject<KitWebSocket>();
  // var kitRepository = inject<KitRepository>();
  // var definitionRepository = inject<DefinitionsRepository>();
  Stream channel;
  //
  // List<KitConfiguration> configurations;
  // KitConfiguration activeConfiguration;

  // List<PeripheralDefinition> peripheralDefinition;
  // List<QuantityType> quantityType;
  Future<List<RawMeasurement>> rawMeasurements;

  @override
  void initState() {
    super.initState();
    kitStore.serial = 'k-hvcx-p3qg-7dfq';
    rawMeasurements = _getRawMeasurements();

    // subscribe to stream of measurements
    // kitWebSocket.subscribeMeasurements('k-hvcx-p3qg-7dfq');
    // channel = kitWebSocket.getStreamMeasurements();

    channel = kitStore.getStreamMeasurements();
  }

  Future<List<RawMeasurement>> _getRawMeasurements() async {

    // // fetch definitions
    // await defStore.init();
    // print(defStore.hasResults);
    //
    // peripheralDefinition =
    //     await definitionRepository.getPeripheralDefinitions();
    // quantityType = await definitionRepository.getQuantityTypes();
    //
    // // State quantity type / peripheral definition in Map
    // var mapDefinition = <int, PeripheralDefinition>{
    //   for (PeripheralDefinition e in peripheralDefinition) e.id: e
    // };
    // var mapQuantityType = {for (QuantityType e in quantityType) e.id: e};

    // Look for the active configuration (active) for our selected kit and get peripherals with their ids
    // Then, for every peripheral get quantityTypeID and map all that to List<RawMeasurement>

    await kitStore.fetchConfigurations();
    print(kitStore.hasResults);
    print(kitStore.activeConfiguration);
    await kitStore.fetchRawMeasurements();
    print(kitStore.rawMeasurements);

    // select default raw measurement
    DashboardScreen.of(context).selectedMeasurement = kitStore.rawMeasurements[_defaultSelectedIndex];

    return kitStore.rawMeasurements;

    // // Get first active configuration
    // configurations = await kitRepository.getConfigurations('k-hvcx-p3qg-7dfq');
    // activeConfiguration =
    //     configurations.where((element) => element.active == true).first;
    //
    // var peripherals = activeConfiguration.peripherals;
    //
    // var p = peripherals
    //     .expand((peripheral) => {
    //           mapDefinition[peripheral.peripheralDefinitionId]
    //               .expectedQuantityTypes
    //               .expand((quantityId) => {
    //                     RawMeasurement(
    //                         title: mapQuantityType[quantityId].physicalQuantity,
    //                         subtitle: peripheral.name,
    //                         unitSymbol:
    //                             mapQuantityType[quantityId].physicalUnitSymbol,
    //                         quantityTypeId: quantityId,
    //                         peripheralId: peripheral.id)
    //                   })
    //               .toList()
    //         })
    //     .toList()
    //     .expand((i) => i)
    //     .toList();
    //
    //
    // // select default raw measurement
    // DashboardScreen.of(context).selectedMeasurement = p[_defaultSelectedIndex];
    //
    // return p;
  }

  /// Card
  List<IToggleable> listViewCard(AsyncSnapshot<List<RawMeasurement>> snapshot) {
    return snapshot.data
        .map((measurement) => CCardPeripheral(
              title: measurement.title,
              subtitle: measurement.subtitle,
              unit: measurement.unitSymbol,
              stream: channel.where((stream) =>
                  stream.peripheralId == measurement.peripheralId &&
                  stream.quantityTypeId == measurement.quantityTypeId),
              onPressed: () {
                print('peripheralId = ${measurement.peripheralId} pressed');
                // set state of selected measurement to show historical data
                DashboardScreen.of(context).selectedMeasurement = measurement;
              },
            ))
        .toList();
  }

  /// List of peripherals
  Widget _buildListCCardPeripheral() {
    return FutureBuilder<List<RawMeasurement>>(
      future: rawMeasurements,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: CToggleWidget(
                  defaultSelectedIndex: _defaultSelectedIndex,
                  children: listViewCard(snapshot),
                ),
              ),
            ],
          );
        }
        // By default, show a loading spinner.
        return CCardPeripheralLoading();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      margin: EdgeInsets.only(bottom: CPadding.defaultPadding),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildListCCardPeripheral(),
        ],
      ),
    );
  }
}