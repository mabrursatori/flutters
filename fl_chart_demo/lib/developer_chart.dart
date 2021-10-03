import 'package:charts_flutter/flutter.dart';
import 'package:fl_chart_demo/developer_series.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DeveloperChart extends StatefulWidget {
  final List<DeveloperSeries> data;

  DeveloperChart({@required this.data});

  @override
  _DeveloperChartState createState() => _DeveloperChartState();
}

class _DeveloperChartState extends State<DeveloperChart> {
  PageController pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Series<DeveloperSeries, String>> series = [
      Series(
          id: "developers",
          data: widget.data,
          domainFn: (DeveloperSeries series, _) => series.year,
          measureFn: (DeveloperSeries series, _) => series.developers,
          colorFn: (DeveloperSeries series, _) => series.barColor),
          
    ];

    return PageView(
      children: [
        charts.BarChart(
          series,
          animate: true,
        ),
        Center(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.red,
            child: charts.PieChart(series,
                defaultRenderer: charts.ArcRendererConfig(
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(
                          labelPosition: charts.ArcLabelPosition.inside)
                    ]),
                animate: true),
          ),
        ),
      ],
    );
  }
}
