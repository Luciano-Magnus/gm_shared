import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/app_controller.dart';
import 'package:gm_shared/app/controllers/login/login_controller.dart';
import 'package:gm_shared/app/publications/controller/publications_controller.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';

class PublicationsPage extends StatefulWidget {
  @override
  _PublicationsPageState createState() => _PublicationsPageState();
}

class _PublicationsPageState
    extends ModularState<PublicationsPage, PublicationsController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(controller.loginController.user.nameUser);
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
                  SizedBox(height: 8,)
                ],
              ),
              Column(
                children: [
                  Text(
                    'Procurando por grupo',
                    style: TextStyle(color: ColorsApp.textColor),
                  ),
                  SizedBox(height: 8,)
                ],
              ),
            ],

            onTap: (index){
              switch(index){
                case 0: print(index);
                break;
                case 1: print(index);
                break;
              }
            },
            indicatorColor: controller.loginController.useColor,
            isScrollable: true,
          ),
        ),
        body: Column(
          children: [
            Text('Bem vindo'),
            Text(
              controller.loginController.user.nameUser ?? '',
              style: TextStyle(color: controller.loginController.useColor),
            ),
            Text(
              controller.loginController.user.platformUser ?? '',
              style: TextStyle(color: controller.loginController.useColor),
            ),
            Text(
              controller.loginController.user.descriptionUser ?? '',
              style: TextStyle(color: controller.loginController.useColor),
            ),
            Text(
              controller.loginController.user.favoriteGameUser ?? 'ops',
              style: TextStyle(color: controller.loginController.useColor),
            ),
            Text(
              controller.loginController.user.idUser ?? '123',
              style: TextStyle(color: controller.loginController.useColor),
            ),
          ],
        ),
      ),
    );
  }
}
