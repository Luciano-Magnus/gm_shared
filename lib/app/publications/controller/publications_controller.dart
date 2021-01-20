

import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/controllers/login/login_controller.dart';
import 'package:mobx/mobx.dart';

part 'publications_controller.g.dart';

class PublicationsController = _PublicationsController with _$PublicationsController;

abstract class _PublicationsController with Store{
  LoginController loginController = Modular.get<LoginController>();

}

