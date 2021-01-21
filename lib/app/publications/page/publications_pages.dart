import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/app_controller.dart';
import 'package:gm_shared/app/controllers/login/login_controller.dart';
import 'package:gm_shared/app/publications/controller/publications_controller.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';
import 'package:gm_shared/shared/components/publications/card_publication_widget.dart';

class PublicationsPage extends StatefulWidget {
  @override
  _PublicationsPageState createState() => _PublicationsPageState();
}

class _PublicationsPageState
    extends ModularState<PublicationsPage, PublicationsController> {
  AppController appController = Modular.get<AppController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPublications();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorsApp.primaryColor,
        appBar: AppBar(
          title: Text('Publicações'),
          centerTitle: true,
          backgroundColor: ColorsApp.primaryColor,
          bottom: TabBar(
            tabs: [
              Column(
                children: [
                  Text(
                    'Compartilhados',
                    style: TextStyle(color: ColorsApp.textColor),
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Procurando por grupo',
                    style: TextStyle(color: ColorsApp.textColor),
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
            ],
            onTap: (index) async {
              switch (index) {
                case 0:
                  controller.isPrimaryPage = true;
                  _loadPublications();
                  break;
                case 1:
                  controller.isPrimaryPage = false;
                  break;
              }
            },
            indicatorColor: controller.loginController.useColor,
            isScrollable: true,
          ),
        ),
        body: Observer(
          builder: (_) {
            return controller.isPrimaryPage
                ? Container(
                    child: Column(
                      children: [
                        Flexible(
                          child: ListView.builder(
                            itemCount: controller.publications.length ?? 0,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: CardPublicationWidget(
                                  publication: controller.publications[index],
                                  borderColor:
                                      controller.loginController.useColor,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    child: Text(
                      'TELA 2',
                      style: TextStyle(color: Colors.green),
                    ),
                  );
          },
        ),
      ),
    );
  }

  Future<void> _loadPublications() async {
    print('Carregando publicações da Api...');
    await controller.getPublications();
  }
}
