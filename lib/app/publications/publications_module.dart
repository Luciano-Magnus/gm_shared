import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/publications/controller/publications_controller.dart';
import 'package:gm_shared/app/publications/page/publications_pages.dart';

class PublicationsModule extends ChildModule{
  @override
  List<Bind> get binds => [
    Bind((i) => PublicationsController(),)
  ];

  @override
  // TODO: implement routers
  List<ModularRouter> get routers =>[
    ModularRouter('/', child: (_, args) => PublicationsPage()),
  ];

}