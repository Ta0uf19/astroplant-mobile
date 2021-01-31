import 'package:app/ui/constants.dart';
import 'package:flutter/material.dart';


const Color defaultColorText = CColors.black;
const String defaultTitle = 'Title';
const String defaultsSubTitle = 'SubTitle';
const String defaultDescription = 'Description';
const double defaultSpaceBetween = 0.0;
const double defaultFontSize = 15.0;

class CColumnText extends StatelessWidget {
  CColumnText({
    Key key,
    this.colorText = defaultColorText,
    this.title = defaultTitle,
    this.subTitle = defaultsSubTitle,
    this.description = defaultDescription,
    this.spaceBetween = defaultSpaceBetween,
    this.fontSize = defaultFontSize,
  }) : super(key: key);

  final Color colorText;
  final String title;
  final String subTitle;
  final String description;
  /// Place the free space evenly between the children.
  final double spaceBetween;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text(
                title,
                style: TextStyle(color: colorText,fontSize: fontSize),
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
              SizedBox(height: spaceBetween,),
              Text(
                subTitle,
                style: TextStyle(color: colorText.withOpacity(0.5),fontSize: fontSize-2),
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
              SizedBox(height: spaceBetween,),
              Container(
                child: Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    description,
                    style: TextStyle(color: colorText.withOpacity(0.25),fontSize: fontSize-2,),
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
