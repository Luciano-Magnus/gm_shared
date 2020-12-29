import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/app_controller.dart';
import 'package:gm_shared/app/app_widget.dart';
import 'package:gm_shared/app/controllers/home/home_controller.dart';
import 'package:gm_shared/app/controllers/login/login_controller.dart';
import 'package:gm_shared/app/pages/home/home_page.dart';
import 'package:gm_shared/app/pages/login/login_page.dart';
import 'package:gm_shared/app/pages/login/login_user_page.dart';
import 'package:gm_shared/app/pages/splash/my_splash_screen.dart';

class AppModule extends MainModule{
  @override
  // TODO: implement binds
  List<Bind> get binds => [
      Bind((i) => AppController()),
      Bind((i) => LoginController()),
      Bind((i) => HomeController(i.get<LoginController>())),
  ];

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => MySplashScreen()),
    ModularRouter('/LoginUserPage', child: (_, args) => LoginUserPage()),
    ModularRouter('/LoginPage', child: (_, args) => LoginPage()),
    ModularRouter('/HomePage', child: (_, args) => HomePage()),
  ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();
}