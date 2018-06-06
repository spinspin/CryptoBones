import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';


var enterHomeScreenHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
   return new EnterNameScreen();
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
