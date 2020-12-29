import 'package:file/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/controllers/login/login_controller.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';
import 'package:gm_shared/app/utils/img/img_app.dart';
import 'package:gm_shared/shared/components/foto_perfil/foto_perfil_controller.dart';
import 'file:///C:/Users/Luciano%20Magnus/AndroidStudioProjects/gm_shared/lib/shared/components/foto_perfil/foto_perfil_widget.dart';
import 'package:image_picker/image_picker.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends ModularState<PerfilPage, LoginController> {
  FotoPerfilController fotoPerfilController = Modular.get<FotoPerfilController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Perfil',
          style: TextStyle(color: controller.useColor),
        ),
        backgroundColor: ColorsApp.primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 130,
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: (){
                  controller.getPhoto();
                },
                child: Tooltip(
                  message: 'Adicione sua foto de perfil',
                  child: Observer(
                    builder: (_) {
                      return FotoPerfilWidget(
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
