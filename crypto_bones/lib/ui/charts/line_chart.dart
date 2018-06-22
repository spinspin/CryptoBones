import 'package:charts_common/common.dart';
/// Example of timeseries chart with custom measure and domain formatters.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomAxisTickFormatters extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  CustomAxisTickFormatters(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - 20.0,
        height: 300.0,
        child: new charts.TimeSeriesChart(seriesList,
 
      

            animate: animate,
            // Sets up a currency formatter for the measure axis.
            primaryMeasureAxis: new charts.NumericAxisSpec(
                tickFormatterSpec: new charts.BasicNumericTickFormatterSpec(
                    new NumberFormat.compactSimpleCurrency())),
                

            /// Customizes the date tick formatter. It will print the day of month
            /// as the default format, but include the month and year if it
            /// transitions to a new month.
            ///
            /// minute, hour, day, month, and year are all provided by default and
            /// you can override them following this pattern.
            domainAxis: new charts.DateTimeAxisSpec(
                showAxisLine: false,
                tickFormatterSpec: new charts.AutoDateTimeTickFormatterSpec(
                    day: new charts.TimeFormatterSpec(
                        format: 'd', transitionFormat: 'MM/dd/yyyy')))));
  }
}

/// Sample time series data type.
class MyRow {
  final DateTime timeStamp;
  final int cost;
  MyRow(this.timeStamp, this.cost);
}
