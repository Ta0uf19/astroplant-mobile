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
import 'package:flutter_mobx/flutter_mobx.dart';
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

  /// Reaction : A method that will be called whenever the subject change

  // Load reactions and store them in _disposers
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _kitStore ??= Provider.of<KitStore>(context);
    _disposers ??= [
      reactionOnConfigurationChanges(),
    ];

    _getListKitConfiguration();
  }

  ReactionDisposer reactionOnConfigurationChanges() {
    return reaction(
      (_) => _kitStore.configurations.length,
      (int listKitConfiguration) {
        if (listKitConfiguration != 0) {
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

  // Refresh store list of configuration
  Future _getListKitConfiguration() async {
    await _kitStore.fetchConfigurations();
    print(_kitStore.hasResults);
    print(_kitStore.activeConfiguration);

    return;
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
          showAddConfigurationDialogue(context, themeData);
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
        child: Observer(
          builder: (context) => buildListOfConfigurations(),
        ),
      ),
    );
  }

  // Create ListView of Store.configurations
  ListView buildListOfConfigurations() {
    return ListView.builder(
          itemCount: _kitStore.configurations.length,
          itemBuilder: (BuildContext context, int index) => Container(
            margin: EdgeInsets.only(bottom: CPadding.defaultSmall),
            child: buildRowConfiguration(index, context),
          ),
        );
  }

  // Create one row of configuration
  CCard buildRowConfiguration(int index, BuildContext context) {
    return CCard(
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
                  title: _kitStore.configurations[index].description,
                  subTitle:
                      'identifier : ${_kitStore.configurations[index].id}',
                  description: _kitStore.configurations[index].active
                      ? 'Currently used'
                      : _kitStore.configurations[index].neverUsed
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
                    builder: (context) => EditConfigurationScreen(indexConfiguration: index,)),
              );
            },
            suffixWidget: Container(
              padding: EdgeInsets.all(CPadding.defaultSmall),
              alignment: Alignment.center,
              child: CToggleSwitch(
                  value: _kitStore.configurations[index].active,
                  width: 40,
                  height: 25,
                  toggleSize: 15,
                  onToggle: (val) {
                    setState(() {
                      _kitStore.configurations[index].active == false
                          ? _kitStore.activateConfiguration(index)
                          : _kitStore.deactivateConfiguration(index);
                      //var status = val;
                    });
                  }),
            ),
          );
  }

  showAddConfigurationDialogue(BuildContext context, ThemeData themeData) {
    var description = '';

    // set up the button
    Widget okButton = FlatButton(
      child: Text('Create'),
      onPressed: () async {
        print('description $description');
        var configuration = await _kitStore.addConfiguration(description);
        //if(configuration != null )listKitConfiguration = _getListKitConfiguration();
        if (configuration != null) {
          _getListKitConfiguration();
          Navigator.pop(context);
        } else {
          print('screen : add configuration error');
        }
      },
    );

    //set up text field
    Widget descriptionText = CTextInput(
      textHint: 'Description',
      backgroundColor: CColors.greyLight,
      textColor: CColors.black,
      onChanged: (value) {
        description = value;
      },
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
