
import 'package:app/models/definitions/peripheral_definition.dart';
import 'package:app/stores/kit/kit_store.dart';
import 'package:app/ui/widgets/ccard.dart';
import 'package:app/ui/widgets/ccard_peripheral.dart';
import 'package:app/ui/widgets/ccard_peripheral_loading.dart';
import 'package:app/ui/widgets/ccolumn_text.dart';
import 'package:app/ui/widgets/cheader.dart';
import 'package:app/ui/widgets/ctoggle_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/constants.dart';
import 'package:provider/provider.dart';


class CommandScreen extends StatefulWidget {
  @override
  _CommandScreen createState() => _CommandScreen();
}

class _CommandScreen extends State<CommandScreen> {
  PeripheralDefinition _selectedPeripheral;

  set selectedPeripheral(PeripheralDefinition selectedPeripheral) =>
      setState(() => _selectedPeripheral = selectedPeripheral);

  PeripheralDefinition get selectedPeripheral => _selectedPeripheral;

  bool status = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: CColors.black,
      appBar:
          CHeader.buildAppBarWithCButton(context: context, title: 'Commands'),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int block) {
            return Container(
              width: size.width,
              padding: EdgeInsets.only(
                left: CPadding.defaultSidesSmall,
                right: CPadding.defaultSidesSmall,
                top: CPadding.defaultSmall,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: CPadding.defaultPadding),
                    child: CCard(
                      //height: 100,
                      body: Column(
                        children: [
                          CColumnText(
                            title: 'Kit1',
                            subTitle: 'version : 4.2.1',
                            description: 'Kit uptime 2 hours',
                            colorText: CColors.white,
                          ),
                        ],
                      ),
                      colorBackground: Color.fromRGBO(29, 29, 29, 1),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Command Peripherals",
                          style: themeData.textTheme.headline3,
                        ),
                        SizedBox(
                          height: CPadding.defaultSmall,
                        ),
                        Text(
                          "Please choose the peripheral to send a command to.",
                          style: themeData.textTheme.subtitle2,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                  GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                        CCard(
                          width: size.width / 2 - 3 * CPadding.defaultSmall,
                          body: CColumnText(
                            title: "Temp",
                            subTitle: "Identifier : #127",
                            description: "Virtual temperature sensor",
                            colorText: CColors.white,
                          ),
                          colorBackground: Color.fromRGBO(29, 29, 29, 1),
                          onPressed: () {},
                        ),
                        CCard(
                          width: size.width / 2 - 3 * CPadding.defaultSmall,
                          body: CColumnText(
                            title: "Temp",
                            subTitle: "Identifier : #127",
                            description: "Virtual temperature sensor",
                            colorText: CColors.white,
                          ),
                          colorBackground: Color.fromRGBO(29, 29, 29, 1),
                          onPressed: () {},
                        ),
                        CCard(
                          width: size.width / 2 - 3 * CPadding.defaultSmall,
                          body: CColumnText(
                            title: "Temp",
                            subTitle: "Identifier : #127",
                            description: "Virtual temperature sensor",
                            colorText: CColors.white,
                          ),
                          colorBackground: Color.fromRGBO(29, 29, 29, 1),
                          onPressed: () {},
                        ),
                        CCard(
                          width: size.width / 2 - 3 * CPadding.defaultSmall,
                          body: CColumnText(
                            title: "Temp",
                            subTitle: "Identifier : #127",
                            description: "Virtual temperature sensor",
                            colorText: CColors.white,
                          ),
                          colorBackground: Color.fromRGBO(29, 29, 29, 1),
                          onPressed: () {},
                        ),
                      ])
                ],
              ),
            );
          }),
    );
  }
}


class PeripheralCard extends StatefulWidget {
  const PeripheralCard({
    Key key,
  }) : super(key: key);

  @override
  _PeripheralCardState createState() =>
      _PeripheralCardState();
}

class _PeripheralCardState extends State<PeripheralCard> {
  KitStore kitStore;
  final int _defaultSelectedIndex = 0;
  Stream channel;
  Future<List<PeripheralDefinition>> peripherals;
  @override
  void initState() {
    super.initState();
  }
  /*Future<List<PeripheralDefinition>*/ void _getPeripherals() async {

    // Look for the active configuration (active) for our selected kit and get peripherals with their ids
    // Then, for every peripheral get quantityTypeID and map all that to List<RawMeasurement>

    await kitStore.fetchConfigurations();
    print(kitStore.hasResults);
    print(kitStore.activeConfiguration);
    /* await kitStore.peripherals();
    print(kitStore.peripherals);*/
   /* await kitStore.fetchRawMeasurements();
    print(kitStore.rawMeasurements);*/

    // select default raw measurement
    //DashboardScreen.of(context).selectedMeasurement = kitStore.rawMeasurements[_defaultSelectedIndex];

    return //kitStore.peripherals;
    //kitStore.rawMeasurements;

  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // initializing stores
    kitStore = Provider.of<KitStore>(context);
    kitStore.serial = 'k-vhc3-3f8p-x9fd';
   // peripherals = _getPeripherals();

    // subscribe to streams of measurements for realtime
    channel = kitStore.getStreamMeasurements();
    //channel = kitStore.getStreamPeripherals();
  }

  @override
  void dispose() {
    kitStore.closeStreamMeasurements();
    //kitStore.closeStreamPeripherals();
    super.dispose();
  }
  /// Card
  List<IToggleable> listViewCard(AsyncSnapshot<List<PeripheralDefinition>> snapshot) {
    return snapshot.data
        .map((peripheralDefinition) => CCardPeripheral(
      title: peripheralDefinition.name,
      subtitle: peripheralDefinition.description,
      unit: peripheralDefinition.brand,
      stream: channel.where((stream) =>
      stream.id == peripheralDefinition.id &&
          stream.model == peripheralDefinition.model),
      onPressed: () {
        print('peripheralId = ${peripheralDefinition.id} pressed');
        // set state of selected measurement to show historical data
        //CommandScreen.of(context).selectedMeasurement = peripheralDefinition;
      },
    ))
        .toList();
  }

  /// List of peripherals
  Widget _buildListCCardPeripheral() {
    return FutureBuilder<List<PeripheralDefinition>>(
      future: peripherals,
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