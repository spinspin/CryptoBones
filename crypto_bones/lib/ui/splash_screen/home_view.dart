import 'package:crypto_bones/ui/charts/line_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base/presenter_factory_producer.dart';
import 'home_view_presenter.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeViewState();
}

class HomeViewState extends State<HomeView> implements HomeViewContract {
  HomeViewPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = PresenterFactoryProducer.getPresenter(ViewType.homeview, this);
    // var test = _presenter.requestCryptoInfoWorkload();
  }

  @override
  Widget build(BuildContext buildContext) {
    return new Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return new SafeArea(
      bottom: false,
      child: new Container(
        color: const Color(0xFF131619),
              // color: Colors.white,
        padding: const EdgeInsets.only(top: 20.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            currentPriceSection(),
            percentageChangeSection(),
            chart(),
          ],
        ),
      ),
    );
  }

  Widget currentPriceSection() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(
          _presenter.getFiatType(),
          style: new TextStyle(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        new Text(
          _presenter.getCurrentPrice(),
          style: new TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget percentageChangeSection() {
    return new Padding(
      padding: new EdgeInsets.only(top:6.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            _presenter.get24HourPercentageChange(),
            style: new TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          ),
          new Text(
            "(24h)",
            style: new TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }



Widget chart() {

  return new Container(
    child: new CustomAxisTickFormatters(_createSampleData()),
  );

}//


  /// Create one series with sample hard coded data.
  static List<charts.Series<MyRow, DateTime>> _createSampleData() {
    final data = [
      new MyRow(new DateTime(2017, 9, 25), 6),
      new MyRow(new DateTime(2017, 9, 26), 8),
      new MyRow(new DateTime(2017, 9, 27), 6),
      new MyRow(new DateTime(2017, 9, 28), 9),
      new MyRow(new DateTime(2017, 9, 29), 11),
      new MyRow(new DateTime(2017, 9, 30), 15),
      new MyRow(new DateTime(2017, 10, 01), 25),
      new MyRow(new DateTime(2017, 10, 02), 33),
      new MyRow(new DateTime(2017, 10, 03), 27),
      new MyRow(new DateTime(2017, 10, 04), 31),
      new MyRow(new DateTime(2017, 10, 05), 200),
    ];

    return [
      new charts.Series<MyRow, DateTime>(
        id: 'Cost',
        domainFn: (MyRow row, _) => row.timeStamp,
        measureFn: (MyRow row, _) => row.cost,
        data: data,
      )
    ];
  }
}