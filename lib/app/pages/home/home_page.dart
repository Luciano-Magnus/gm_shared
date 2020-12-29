import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/controllers/home/home_controller.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.setUseColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primaryColor,
      body: Center(
        child: Text(
          'BEM VINDO A HOME PAGE ${controller.login.userName.toUpperCase()}',
          style: TextStyle(
            color: controller.login.useColor,
          ),
        ),
      ),
    );
  }
}
