// Copyright (c) 2021 Taoufik Tribki. All rights reserved.
import 'dart:developer';

import 'package:app/components/IToggleable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// CToggleButton manage state itself
/// A mix-and-match approach

/// Allow at least one button to get selected at a time.
/// List of boolean values to store selected/unselected state:
class CToggleWidget extends StatefulWidget {

  /// The toggle button widgets
  final List<IToggleable> children;

  /// The callback that is called when a button is tapped.
  final void Function(int index) onPressed;

  /// Default selected key
  final int defaultSelectedIndex;

  // Space between widgets (right padding)
  final double spacePadding;

  CToggleWidget({
    Key key,
    @required this.children,
    this.onPressed,
    this.defaultSelectedIndex = 0,
    this.spacePadding = 20
  }): assert(children != null),
      assert(defaultSelectedIndex < children.length && defaultSelectedIndex >= 0, 'There is such index : $defaultSelectedIndex for children in your CToggleWidget\n'),
      super(key: key);

  @override
  _CToggleWidgetState createState() => _CToggleWidgetState();

}
class _CToggleWidgetState extends State<CToggleWidget> {

  /// Current selected index
  int _currentIndex;
  /// The corresponding selection state of each toggle button.
  List<bool> _isSelected = [];

  @override
  void initState() {
    super.initState();
    _isSelected = new List<bool>.filled(widget.children.length, false, growable: true);
    _currentIndex = widget.defaultSelectedIndex ?? 0;
    _isSelected[_currentIndex] = true;

    log(_isSelected.toString());
  }

  /// Changing state
  void _onItemClick(int index) {
    if(widget.onPressed != null) {
      widget.onPressed(index);
    }
    setState(() {
      _currentIndex = index;
      for (int i = 0; i < _isSelected.length; i++) {
        _isSelected[i] = (i == index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.children.map((element) {
        final int index = widget.children.indexOf(element);

        return Container(
          padding: EdgeInsets.only(right: widget.spacePadding),
          child: RawGestureDetector(
              gestures: {
                AllowMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<AllowMultipleGestureRecognizer>(
                      () => AllowMultipleGestureRecognizer(),
                      (AllowMultipleGestureRecognizer instance) {
                    instance.onTap = () {
                      _onItemClick(index);
                    };
                  },
                )
              },
              behavior: HitTestBehavior.opaque,
              child: (_currentIndex == index) ? element.copyWith(activeToggle: true) : element
          ),
        );
      }).toList(),
    );
  }
}

// Custom Gesture Recognizer.
// rejectGesture() is overridden. When a gesture is rejected, this is the function that is called. By default, it disposes of the
// Recognizer and runs clean up. However we modified it so that instead the Recognizer is disposed of, it is actually manually added.
// The result is instead you have one Recognizer winning the Arena, you have two. It is a win-win.
class AllowMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}