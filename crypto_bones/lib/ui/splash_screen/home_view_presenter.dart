import 'dart:async';

import '../base/base_contract.dart';
import '../base/base_presenter.dart';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart' as http;

abstract class HomeViewContract implements BaseContract {}

class HomeViewPresenter extends BasePresenter {
  HomeViewContract _view;
  HomeViewPresenter(this._view);

  void requestCryptoInfoWorkload() async {

//https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,EUR
    final http.Response response = await http.get('https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR');
    final responseJson = json.decode(response.body); 
  }

  String getFiatType(){
      return "\$";
  }

  String getCryptoType(){
      return "IOTA";
  }

  String getCurrentPrice(){
      return "1.2183";
  }

    String get24HourPercentageChange(){
      return "12.1%";
  }

}
