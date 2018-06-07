import 'package:flutter/cupertino.dart';

import '../base/presenter_factory_producer.dart';
import 'home_view_presenter.dart';

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
    var test = _presenter.requestCryptoInfoWorkload();

  }

  @override
  Widget build(BuildContext buildContext) {

    return new Container();
  }

  
}
