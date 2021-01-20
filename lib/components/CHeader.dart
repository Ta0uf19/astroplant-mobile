import 'package:flutter/material.dart';


// StatelessWidget
class CHeader extends StatelessWidget {

  CHeader({Key key, this.colorBackground, this.title, this.headersuffix, this.prefixIcon}) : super(key: key);

  final Color colorBackground;
  final String title;
  final suffixitem headersuffix;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: colorBackground,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              topLeft: Radius.circular(5)
          )
      ),
      child:
      Row(
        children: [
          this.prefixIcon!= null ? prefixIcon : Container(),
          Text(
            this.title != null ? title : Container(),
            //style: TextStyle(color: this.colorText, fontSize: this.fontSize),
          ),
        Row (
            children: [
              this.headersuffix.desc!= null ? headersuffix.desc : Container(),
              this.headersuffix.suffix,
            ],
        )
        ],
      ),
    );
  }

}

class suffixitem {
     Text desc;
     Icon suffix;
}

