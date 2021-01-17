import 'package:gm_shared/app/controllers/login/login_controller.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final LoginController login;

  _HomeController(this.login);

  void setUseColor() {
    switch (login.user.platformUser) {
      case 'Computador':
        login.useColor = ColorsApp.pcColor;
        break;
      case 'X box':
        login.useColor = ColorsApp.xboxColor;
        break;
      case 'Playstation':
        login.useColor = ColorsApp.psColor;
        break;
    }
  }

  void setPhotoPlatform(){
    switch (login.user.platformUser) {
      case 'Computador':
        login.assetsPhotoPlatform = 'logo_steam_.svg';
        break;
      case 'X box':
        login.assetsPhotoPlatform = 'logo_xbox.svg';
        break;
      case 'Playstation':
        login.assetsPhotoPlatform = 'logo_playstation.svg';
        break;
    }
  }
}
