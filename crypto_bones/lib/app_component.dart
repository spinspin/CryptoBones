import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'Application.dart';
import 'helper/localisation/translations_delegate.dart';
import 'helper/route/routes.dart';
import 'ui/splash_screen/home_view.dart';
import 'ui/theme/theme_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppComponent extends StatefulWidget {
  @override
  State createState() {
    return new AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new HomeView(),
        title: "Enjoy Showcase",
        localizationsDelegates: [
          const TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''), // English
          const Locale('fr', ''), // French
        ],
        theme: ThemeConfiguration.themeData(Theme.of(context).platform),
        onGenerateRoute: Application.router.generator);
  }
}
