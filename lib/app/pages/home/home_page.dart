import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gm_shared/app/controllers/home/home_controller.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';
import 'package:gm_shared/app/utils/img/img_app.dart';
import 'package:gm_shared/shared/components/card_home_page_widget.dart';
import 'package:gm_shared/shared/components/card_reputacao_widget.dart';
import 'package:gm_shared/shared/components/foto_perfil/foto_perfil_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.setUseColor();
    controller.setPhotoPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: ColorsApp.secundaryColor,
        shadowColor: ColorsApp.secundaryColor,
        elevation: 200,
        centerTitle: true,
        title: Text(controller.login.userName),
        leading: FlatButton(
          onPressed: null,
          child: Column(
            children: [
              SvgPicture.asset(
                '${ImgApp.image}${controller.login.assetsPhotoPlatform}',
                color: controller.login.useColor,
                width: 60,
                height: 60,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: FotoPerfilWidget(
              alignment: MainAxisAlignment.start,
              height: 52,
              width: 52,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 16.0),
          //   child: FotoPerfilWidget(
          //     alignment: MainAxisAlignment.start,
          //     height: 52,
          //     width: 52,
          //   ),
          // )
        ],
      ),
      backgroundColor: ColorsApp.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         CardReputacaoWidget(
           borderColor: controller.login.useColor,
           score: int.parse(controller.login.user.scoreUser),
         ),
          Container(
            height: MediaQuery.of(context).size.height / 1.7,
            child: CardHomePageWidget(
              borderColor: controller.login.useColor,
            ),
          ),
        ],
      ),
    );
  }
}
