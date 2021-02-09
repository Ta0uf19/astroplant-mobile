import 'package:app/ui/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CCardPeripheralLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => SizedBox(
          width: 175,
          height: 250,
          child: Shimmer.fromColors(
            baseColor: CColors.shimmerBaseColor,
            highlightColor: CColors.shimmerHighlightColor,
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Container(
                width: 175,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
