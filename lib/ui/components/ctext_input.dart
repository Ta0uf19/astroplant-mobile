
import 'package:flutter/material.dart';

const defaultTextColor = Color(0xFFDCDCDC);
const defaultBackgroundColor = Color(0xFF1D1D1D);

class CTextInput extends StatefulWidget {

  /// Provide a way for the user to securely enter a password.
  /// The element is presented as a one-line plain text editor control in which the text is obscured so
  /// that it cannot be read, usually by replacing each character with a symbol such as the asterisk ("*") or a dot ("•").
  /// Defaults to [false].
  final bool isPasswordType;

  // The [hintText] attribute specifies a short hint that describes the expected value of an input field
  // The short hint is displayed in the input field before the user enters a value.
  final String textHint;

  /// Specify the color of hint and input text
  /// Defaults to [defaultTextColor].
  final Color textColor;

  /// Specify the prefix prefix
  final Icon icon;

  /// Specify the background color of the input
  final Color backgroundColor;

  // Specify the font size
  final double fontSize;

  const CTextInput({
    Key key,
    this.textHint,
    this.textColor = defaultTextColor,
    this.isPasswordType = false,
    this.icon,
    this.backgroundColor = defaultBackgroundColor,
    this.fontSize = 18
  }) : super(key: key);

  _CTextInputState createState() => _CTextInputState();

}
class _CTextInputState extends State<CTextInput> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius:  BorderRadius.circular(7),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        obscureText: widget.isPasswordType && _obscureText,
        style: TextStyle(
            fontSize: widget.fontSize,
            fontFamily: 'Larsseit',
            color: widget.textColor,
            fontWeight: FontWeight.w600
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 2),
          hintText: widget.textHint,
          labelStyle: TextStyle(
            color: widget.textColor,
          ),
          hintStyle: TextStyle(
            color: widget.textColor
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: widget.icon,
          suffixIcon: widget.isPasswordType ? GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              semanticLabel:
              _obscureText ? 'show password' : 'hide password',
              color: widget.textColor.withOpacity(0.5),
            )
          ) : null,
        ),
      ),
    );
  }
}