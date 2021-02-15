import 'package:app/models/kit/kit_configuration.dart';
import 'package:app/stores/kit/kit_store.dart';
import 'package:app/ui/constants.dart';
import 'package:app/ui/screens/configuration/edit_configuration.dart';
import 'package:app/ui/widgets/ccard.dart';
import 'package:app/ui/widgets/ccolumn_text.dart';
import 'package:app/ui/widgets/cheader.dart';
import 'package:app/ui/widgets/ctext_input.dart';
import 'package:app/ui/widgets/ctoggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class ConfigurationScreen extends StatefulWidget {
  @override
  _ConfigurationScreenState createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  // Store that contains all the data and the logic we will need in this page
  KitStore _kitStore;

  // To store reactions
  List<ReactionDisposer> _disposers;

  /// To use the same context as the main widget in an external widget,
  /// in our case we will use the same context to shaw the external SnackBar
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  /// Future list of configuration
  Future<List<KitConfiguration>> listKitConfiguration;

  /// Reaction : A method that will be called whenever the subject change

  // Load reactions and store them in _disposers
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _kitStore ??= Provider.of<KitStore>(context);
    _disposers ??= [
      reactionOnIsLogged(),
    ];

    listKitConfiguration = _getListKitConfiguration();
  }

  // Navigate whenever the bool isLogged equal to true
  ReactionDisposer reactionOnIsLogged() {
    return reaction(
          (_) => _kitStore.configurations,
          (List<KitConfiguration> listKitConfiguration) {
        if (listKitConfiguration.isNotEmpty) {
          print('listKitConfiguration isNotEmpty');
        } else {
          print('listKitConfiguration isEmpty');
        }
      },
    );
  }

  // Destroy reactions when the page is removed from the tree permanently
  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  Future<List<KitConfiguration>> _getListKitConfiguration() async {
    // Look for the active configuration (active) for our selected kit and get peripherals with their ids
    // Then, for every peripheral get quantityTypeID and map all that to List<RawMeasurement>

    await _kitStore.fetchConfigurations();
    print(_kitStore.hasResults);
    print(_kitStore.activeConfiguration);

    return _kitStore.configurations;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: CColors.black,
      appBar: CHeader.buildAppBarWithCButton(
          context: context, title: 'Configuration'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddConfigurationDialog(context, themeData);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: size.width,
        padding: EdgeInsets.only(
          left: CPadding.defaultSidesSmall,
          right: CPadding.defaultSidesSmall,
          top: CPadding.defaultSmall,
        ),
        child: FutureBuilder<List<KitConfiguration>>(
          future: listKitConfiguration,
          builder: (context, snapshot) {
            if (snapshot.hasData) { return  buildListViewConfiguration(snapshot); }
            else {
              print('loading config');
              return Container();
            };
          }
        ),
      ),
    );
  }

  ListView buildListViewConfiguration(AsyncSnapshot<List<KitConfiguration>> snapshot) {
    return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
                child: CCard(
                  borderRadius: 7,
                  height: 100,
                  body: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/configuration.svg',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CColumnText(
                        title: snapshot.data[index].description,
                        subTitle: 'identifier : ${snapshot.data[index].id}',
                        description: snapshot.data[index].active
                            ? 'Currently used'
                            : snapshot.data[index].neverUsed
                            ? 'Never used'
                            : '',
                        colorText: CColors.white,
                      ),
                    ],
                  ),
                  colorBackground: Color.fromRGBO(29, 29, 29, 1),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditConfigurationScreen()),
                    );
                  },
                  suffixWidget: Container(
                    padding: EdgeInsets.all(CPadding.defaultSmall),
                    alignment: Alignment.center,
                    child: CToggleSwitch(
                        value: snapshot.data[index].active,
                        width: 40,
                        height: 25,
                        toggleSize: 15,
                        onToggle: (val) {
                          setState(() {
                            snapshot.data[index].active == false
                                ? _kitStore.activateConfiguration(index)
                                : _kitStore.deactivateConfiguration(index);
                            //var status = val;
                          });
                        }),
                  ),
                ),
              );
            },
          );
  }

  showAddConfigurationDialog(BuildContext context, ThemeData themeData) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text('Create'),
      onPressed: () {},
    );

    //set up text field
    Widget descriptionText = CTextInput(
      textHint: 'Description',
      backgroundColor: CColors.greyLight,
      textColor: CColors.black,
    );

    // set up the AlertDialog
    var alert = AlertDialog(
      title: Text(
        'My title',
        style: themeData.textTheme.headline3.copyWith(
          color: CColors.black,
        ),
      ),
      content: descriptionText,
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
