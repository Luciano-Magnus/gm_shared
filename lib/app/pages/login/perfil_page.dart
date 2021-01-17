import 'package:file/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/controllers/login/login_controller.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';
import 'package:gm_shared/app/utils/img/img_app.dart';
import 'package:gm_shared/shared/components/btn_plataform.dart';
import 'package:gm_shared/shared/components/foto_perfil/foto_perfil_controller.dart';
import 'package:gm_shared/shared/components/text_form_field_widget.dart';
import 'file:///C:/Users/Luciano%20Magnus/AndroidStudioProjects/gm_shared/lib/shared/components/foto_perfil/foto_perfil_widget.dart';
import 'package:image_picker/image_picker.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends ModularState<PerfilPage, LoginController> {
  FotoPerfilController fotoPerfilController = Modular.get<FotoPerfilController>();
  TextEditingController controllerNameUse = TextEditingController();
  TextEditingController controllerPasswordUse = TextEditingController();
  TextEditingController controllerGame = TextEditingController();
  TextEditingController controllerDesc = TextEditingController();

  @override
  void initState() {
    controllerNameUse.value = controllerNameUse.value.copyWith(text: controller.userName ?? '');
    controllerGame.value = controllerNameUse.value.copyWith(text: controller.user.favoriteGameUser ?? '');
    controllerDesc.value = controllerNameUse.value.copyWith(text: controller.user.descriptionUser ?? '');
    super.initState();

  }
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
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(
              height: 32,
            ),
            TextFormFieldWidget(
              borderColor: controller.useColor,
              controller: controllerNameUse,
              colorText: ColorsApp.textColor,
              labelText: '* Nome de usuário',
            ),
            Observer(
              builder: (_){
                return Container(
                  height: 75,
                  child: TextFormFieldWidget(
                    borderColor: controller.useColor,
                    colorText: ColorsApp.textColor,
                    controller: controllerPasswordUse,
                    labelText: '* Senha',
                    obscureText: controller.visiblityPassword,
                    keybordType: TextInputType.visiblePassword,
                    suffix: Padding(
                      padding:
                      const EdgeInsets.only(top: 8.0),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(30)),
                        ),
                        minWidth: 16,
                        height: 64,
                        child: Icon(
                          controller.visiblityPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: controller.useColor,
                        ),
                        onPressed: () {
                          controller
                              .setVisiblityPassword(
                            !controller
                                .visiblityPassword,
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            TextFormFieldWidget(
              borderColor: controller.useColor,
              controller: controllerGame,
              colorText: ColorsApp.textColor,
              labelText: 'Jogo favorito',
            ),
            TextFormFieldWidget(
              borderColor: controller.useColor,
              controller: controllerDesc,
              colorText: ColorsApp.textColor,
              labelText: 'Descrição',
            ),
            SizedBox(
              height: 32,
            ),
            BtnPlataform(
              title: 'Criar',
              backgroundColor: controller.useColor,
              textColor: ColorsApp.textColor,
              onPressed: (){
                controller.userName = controllerNameUse.text;
                controller.passowrd = controllerPasswordUse.text;
                controller.userDescription = controllerDesc.text;
                controller.userFavoriteGame = controllerGame.text;
                controller.createAccount(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
