import 'package:app/data/kit/kit_repository.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/kit/raw_measurement.dart';
import 'package:app/ui/constants.dart';
import 'package:app/ui/screens/dashboard/dashboard.dart';
import 'package:app/utils/NumberUtils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dart_date/dart_date.dart';

class CLineChart extends StatefulWidget {

  @override
  _CLineChartState createState() => _CLineChartState();
}

class _CLineChartState extends State<CLineChart> {
  var kitRepository = inject<KitRepository>();

  final List<Color> _gradientColors = [
    const Color(0xff35E87C),
    const Color(0xff02d39a),
  ];
  List<FlSpot> _values = const [];

  final int _divider = 35;
  final int _leftLabelsCount = 10;
  double _minX = 0;
  double _maxX = 0;
  double _minY = 0;
  double _maxY = 0;
  double _leftTitlesInterval = 0;
  RawMeasurement selectedMeasurement;
  Future<List<FlSpot>> _future;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CLineChart oldWidget) {
    super.didUpdateWidget(oldWidget);

    var newMeasurement = DashboardScreen.of(context).selectedMeasurement;

    if(selectedMeasurement != newMeasurement) {
      selectedMeasurement = newMeasurement;
      print('new selected measurement -- ${selectedMeasurement}');
      _future = _prepareData();
    }
  }

  Future<List<FlSpot>> _prepareData() async {

    var minY = double.maxFinite;
    var maxY = double.minPositive;

    var _data = await kitRepository.aggregateMeasurements(selectedMeasurement.kitSerial, peripheralId: selectedMeasurement.peripheralId, quantityTypeId: selectedMeasurement.quantityTypeId);

    // pick last date for measurement
    var lastDate = _data.first.datetimeStart;

    _values = _data
        .where((measurement) => measurement.datetimeStart.isSameDay(lastDate))
        .map((measurement) {
            var avg = measurement.average;

            if (minY > avg) minY = avg;
            if (maxY < avg) maxY = avg;
            return FlSpot(
              measurement.datetimeStart.millisecondsSinceEpoch.toDouble(),
              avg,
            );
        })
        .toList()
        .reversed
        .toList();

    _minX = _values.first.x;
    _maxX = _values.last.x;
    _minY = (minY / _divider).floorToDouble() * _divider;
    _maxY = (maxY / _divider).ceilToDouble() * _divider;
    _leftTitlesInterval =
        ((_maxY - _minY) / (_leftLabelsCount - 1)).floorToDouble();
    
    
    return _values;
  }

  LineChartData _mainData() {
    return LineChartData(
      gridData: _gridData(),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: _bottomTitles(),
        leftTitles: _leftTitles(),
      ),
      borderData: FlBorderData(show: false),
      minX: _minX,
      maxX: _maxX,
      minY: _minY,
      maxY: _maxY,
      lineBarsData: [
        _lineBarData()
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          maxContentWidth: 300,
            tooltipBgColor: CColors.cardInactive,
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                final flSpot = barSpot;
                if (flSpot.x == 0 || flSpot.x == 6) {
                  return null;
                }
                return LineTooltipItem(
                  '${NumberUtils.format(flSpot.y)} \n ${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(flSpot.x.toInt()))}',
                  const TextStyle(color: Colors.white, fontFamily: CFontFamily.larsseit, fontSize: 17, fontWeight: FontWeight.w500),
                );
              }).toList();
            }),
      )
    );
  }


  LineChartBarData _lineBarData() {
    return LineChartBarData(
      spots: _values,
      isCurved: true,
      colors: _gradientColors,
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(
          show: true,
          getDotPainter: (FlSpot spot, double xPercentage, LineChartBarData bar, int index) {
            return FlDotCirclePainter(
              radius: 4,
              color: CColors.white,
            );
          }
      ),
      belowBarData: BarAreaData(
        show: true,
        colors: _gradientColors.map((color) => color.withOpacity(0.1)).toList(),
      ),
    );
  }

  SideTitles _bottomTitles() {
    return SideTitles(
      margin: 8,
      interval: (_maxX - _minX) / 6,
      showTitles: true,
      //reservedSize: 20,
      getTextStyles: (value) => const TextStyle(
        color: Color(0xff68737d),
        fontWeight: FontWeight.bold,
        fontSize: 15,
        fontFamily: CFontFamily.larsseit,
      ),
      getTitles: (value) {
        final date = DateFormat.MMMd().format(DateTime.fromMillisecondsSinceEpoch(value.toInt()));
        return date.toString();
      },
    );
  }

  SideTitles _leftTitles() {
    return SideTitles(
      showTitles: true,
      getTextStyles: (value) => const TextStyle(
        color: Color(0xff67727d),
        fontWeight: FontWeight.bold,
        fontSize: 15,
        fontFamily: CFontFamily.larsseit,
      ),
      getTitles: (value) => NumberUtils.format(value),
      reservedSize: 28,
      margin: 12,
      interval: _leftTitlesInterval,
    );
  }

  FlGridData _gridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: false,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 0.8,
        );
      },
      checkToShowHorizontalLine: (value) {
        return (value - _minY) % _leftTitlesInterval == 0;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: false,
      future: _future,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 0,
                      top: 20,
                      bottom: 15,
                    ),
                    child: _values.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : LineChart(_mainData()),
                  ),
                ),
              ),
            ],
          );
        }
        else {
          return Center(child: CircularProgressIndicator());
        }
      },
      // child: Stack(
      //   children: <Widget>[
      //     AspectRatio(
      //       aspectRatio: 1.2,
      //       child: Container(
      //         child: Padding(
      //           padding: const EdgeInsets.only(
      //             right: 10,
      //             left: 0,
      //             top: 20,
      //             bottom: 15,
      //           ),
      //           child: _values.isEmpty
      //               ? Center(child: CircularProgressIndicator())
      //               : LineChart(_mainData()),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}