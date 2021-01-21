import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/publications/controller/publications_controller.dart';
import 'package:gm_shared/app/publications/page/publications_pages.dart';
import 'package:gm_shared/app/publications/service/publications_service.dart';
import 'package:gm_shared/app/publications/service/publications_service_interface.dart';

class PublicationsModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => PublicationsService()),
        Bind(
          (i) => PublicationsController(i.get<IPublicationsService>()),
        ),

      ];

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => PublicationsPage()),
        ModularRouter('/LockingGroup', child: (_, args) => PublicationsPage()),
      ];
}
