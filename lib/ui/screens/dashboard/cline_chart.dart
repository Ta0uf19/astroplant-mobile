
import 'package:app/ui/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CLineChart extends StatefulWidget {
  @override
  _CLineChartState createState() => _CLineChartState();
}

class _CLineChartState extends State<CLineChart> {
  List<Color> gradientColors = [
    const Color(0xff35E87C),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.2,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 0, top: 0, bottom: 15),
              child: LineChart(
                  mainData()
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0.8,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 15, fontFamily: CFontFamily.larsseit),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'JAN';
              case 3:
                return 'FEB';
              case 5:
                return 'MAR';
              case 7:
                return 'APR';
              case 9:
                return 'MAY';
              case 11:
                return 'JUN';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
            fontFamily: 'Larsseit'
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '20';
              case 2:
                return '40';
              case 3:
                return '60';
              case 4:
                return '80';
              case 5:
                return '100';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: false, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (FlSpot spot, double xPercentage, LineChartBarData bar, int index) {
                return FlDotCirclePainter(
                  radius: 5,
                  color: CColors.white,
                );
            }
          ),
          belowBarData: BarAreaData(
            show: false,
            colors: gradientColors.map((color) => color.withOpacity(0.5)).toList(),
          ),
        ),
      ],
    );
  }
}