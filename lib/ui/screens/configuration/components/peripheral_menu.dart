class PeripheralMenu {
  static void choiceAction(String choice) {
    if (choice == PeripheralMenuChoices.Settings) {
      print('Settings');
    } else if (choice == PeripheralMenuChoices.Subscribe) {
      print('Subscribe');
    } else if (choice == PeripheralMenuChoices.SignOut) {
      print('SignOut');
    }
  }
}

class PeripheralMenuChoices {
  static const String Subscribe = 'Subscribe';
  static const String Settings = 'Settings';
  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[Subscribe, Settings, SignOut];
}
