import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/app_controller.dart';
import 'package:gm_shared/app/app_widget.dart';
import 'package:gm_shared/app/controllers/login/login_controller.dart';
import 'package:gm_shared/app/pages/login/login_page.dart';
import 'package:gm_shared/app/pages/login/login_user_page.dart';

class AppModule extends MainModule{
  @override
  // TODO: implement binds
  List<Bind> get binds => [
      Bind((i) => AppController()),
      Bind((i) => LoginController()),
  ];

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => LoginPage()),
    ModularRouter('/LoginUserPage', child: (_, args) => LoginUserPage()),
  ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();
}