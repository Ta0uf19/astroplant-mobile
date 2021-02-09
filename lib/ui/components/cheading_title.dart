import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/constants.dart';
import 'package:shimmer/shimmer.dart';

class CHeadingTitle extends StatelessWidget {
  const CHeadingTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    if (title.isEmpty) {
      return Container(
        child: Shimmer.fromColors(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey,
            ),
            height: 20,
            width: 150,
          ),
          baseColor: CColors.shimmerBaseColor,
          highlightColor: CColors.shimmerHighlightColor,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(bottom: CPadding.defaultSmall),
      );
    }

    return Container(
      child: Text(title, style: themeData.textTheme.headline3),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(bottom: CPadding.defaultSmall),
    );
  }
}
