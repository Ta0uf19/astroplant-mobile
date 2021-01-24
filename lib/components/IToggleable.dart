import 'package:flutter/cupertino.dart';
abstract class IToggleable<T extends Widget> {

  /// This methods clone immutable widget and add the possibility to specify
  /// active/inactive state for toggle widget when pressed
  T copyWith({bool activeToggle});
}