

import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/controllers/login/login_controller.dart';
import 'package:gm_shared/app/publications/Model/publications_model.dart';
import 'package:gm_shared/app/publications/service/publications_service_interface.dart';
import 'package:mobx/mobx.dart';

part 'publications_controller.g.dart';

class PublicationsController = _PublicationsController with _$PublicationsController;

abstract class _PublicationsController with Store{
  final IPublicationsService publicationsService;
  LoginController loginController = Modular.get<LoginController>();

  _PublicationsController(this.publicationsService);

  @observable
  List<Publications> publications = List();

  @observable
  bool isPrimaryPage = true;

  @action
  Future<void> getPublications()async{
    publications = await publicationsService.getPublications().asObservable();
  }
}

