import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final int sales;
}

class ChartSongWidget extends StatefulWidget {
  const ChartSongWidget({super.key});

  @override
  State<ChartSongWidget> createState() => _ChartSongWidgetState();
}

class _ChartSongWidgetState extends State<ChartSongWidget> {
  List<SalesData> randomData() {
    List<SalesData> fakeData = [
      SalesData("00h", Random().nextInt(100)),
      SalesData("03h", Random().nextInt(100)),
      SalesData("06h", Random().nextInt(100)),
      SalesData("09h", Random().nextInt(100)),
      SalesData("12h", Random().nextInt(100)),
      SalesData("15h", Random().nextInt(100)),
      SalesData("18h", Random().nextInt(100)),
      SalesData("21h", Random().nextInt(100)),
      SalesData("23h", Random().nextInt(100)),
    ];
    return fakeData;
  }

  List<SalesData> data = [];
  List<SalesData> data2 = [];
  List<SalesData> data3 = [];

  static final DateTime dateNow = DateTime.now();
  // static String second =
  //     dateNow.second < 10 ? "0${dateNow.second}" : "${dateNow.second}";
  final String _now =
      '${dateNow.day}/${dateNow.month}/${dateNow.year} ${dateNow.hour}:${dateNow.minute}';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    data = randomData();
    data2 = randomData();
    data3 = randomData();

    _timer = Timer.periodic(const Duration(seconds: 0), (Timer t) {
      setState(() {
        // DateTime dateNow = DateTime.now();
        // String second =
        //     dateNow.second < 10 ? "0${dateNow.second}" : "${dateNow.second}";
        // _now =
        //     '${dateNow.day}/${dateNow.month}/${dateNow.year} ${dateNow.hour}:${dateNow.minute}';
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(),
      // Chart title
      title: ChartTitle(text: 'Hôm nay $_now'),
      // Enable legend
      legend: const Legend(
        isVisible: true,
      ),
      // Enable tooltip
      tooltipBehavior: TooltipBehavior(
        enable: true,
      ),
      series: <CartesianSeries<SalesData, String>>[
        LineSeries<SalesData, String>(
          dataSource: data2,
          xValueMapper: (SalesData sales, _) => sales.year,
          yValueMapper: (SalesData sales, _) => sales.sales,
          name: 'Em đây chẳng phải Thuý Kiều',
          // Enable data label
          dataLabelSettings: const DataLabelSettings(
            isVisible: false,
          ),
          color: Colors.blue[600],
        ),
        LineSeries<SalesData, String>(
          dataSource: data,
          xValueMapper: (SalesData sales, _) => sales.year,
          yValueMapper: (SalesData sales, _) => sales.sales,
          name: 'Không một bài hát nào có thể diễn tả cảm xúc của em lúc này',
          // Enable data label
          dataLabelSettings: const DataLabelSettings(
            isVisible: false,
          ),
          color: Colors.green[600],
        ),
        LineSeries<SalesData, String>(
          dataSource: data3,
          xValueMapper: (SalesData sales, _) => sales.year,
          yValueMapper: (SalesData sales, _) => sales.sales,
          name: 'Gieo quẻ',
          // Enable data label
          dataLabelSettings: const DataLabelSettings(
            isVisible: false,
          ),
          color: Colors.red[600],
        ),
      ],
    );
  }
}
