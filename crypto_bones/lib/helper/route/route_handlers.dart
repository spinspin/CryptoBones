import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../ui/splash_screen/home_view.dart';

var enterHomeViewHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new HomeView();
});

/*var enterProfileScreenHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {

  DeveloperName developerName;
  switch (params["developername"]?.first) {
    case "JON":
      {
        developerName = DeveloperName.Jon;
        break;
      }

      case "PAUL":
      {
        developerName = DeveloperName.Paul;
        break;
      }
  }

  return new DeveloperDetailsAnimator(developerName);
});*/
