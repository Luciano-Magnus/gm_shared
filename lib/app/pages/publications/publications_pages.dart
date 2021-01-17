import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/controllers/login/login_controller.dart';

class PublicationsPage extends StatefulWidget {
  @override
  _PublicationsPageState createState() => _PublicationsPageState();
}

class _PublicationsPageState extends ModularState<PublicationsPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Publicações'),
      ),
      body: Column(
        children: [
          Text('Bem vindo'),
          Text(controller.user.nameUser ?? '', style: TextStyle(color: controller.useColor),),
          Text(controller.user.platformUser ?? '', style: TextStyle(color: controller.useColor),),
          Text(controller.user.descriptionUser ?? '', style: TextStyle(color: controller.useColor),),
          Text(controller.user.favoriteGameUser ?? 'ops', style: TextStyle(color: controller.useColor),),
          Text(controller.user.idUser ?? '123', style: TextStyle(color: controller.useColor),),

        ],
      ),
    );
  }
}
