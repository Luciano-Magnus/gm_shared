import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: ColorsApp.primaryColor,
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'GM Shared',
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}