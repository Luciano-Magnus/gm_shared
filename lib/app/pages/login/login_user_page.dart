import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/controllers/login/login_controller.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';
import 'package:gm_shared/shared/components/btn_plataform.dart';
import 'package:gm_shared/shared/components/gradient_text.dart';
import 'package:gm_shared/shared/components/text_form_field_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginUserPage extends StatefulWidget {
  @override
  _LoginUserPageState createState() => _LoginUserPageState();
}

class _LoginUserPageState extends State<LoginUserPage> {
  final loginController = Modular.get<LoginController>();

  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerPassowrd = TextEditingController();
  @override
  Widget build(BuildContext context) {
     loginController.useColor = ColorsApp.primaryColor;
     loginController.titleAndPlatform = '';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          loginController.titleAndPlatform,
          style: GoogleFonts.acme(
            color: loginController.useColor,
            fontSize: 24,
          ),
        ),
        backgroundColor: ColorsApp.primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: loginController.useColor,
          ),
          onPressed: () {
            Modular.to.pop();
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: ColorsApp.primaryColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  'Login',
                  style: GoogleFonts.pacifico(
                      color: ColorsApp.textColor, fontSize: 50),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.1,
                  child: Card(
                    shadowColor: loginController.useColor,
                    borderOnForeground: true,
                    elevation: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                            width: 0.5, color: loginController.useColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            'Entrar na conta',
                            style: GoogleFonts.acme(
                              color: loginController.useColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Form(
                              child: Container(
                                height: 75,
                                child: TextFormFieldWidget(
                                  controller: controllerUserName,
                                  borderColor: loginController.useColor,
                                  labelText: 'Nome de usuário',
                                ),
                              ),
                            ),
                            Form(
                              child: Container(
                                height: 75,
                                child: Observer(
                                  builder: (BuildContext context) {
                                    return TextFormFieldWidget(
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
                                            loginController.visiblityPassword
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: loginController.useColor,
                                          ),
                                          onPressed: () {
                                            loginController
                                                .setVisiblityPassword(
                                              !loginController
                                                  .visiblityPassword,
                                            );
                                          },
                                        ),
                                      ),
                                      controller: controllerPassowrd,
                                      obscureText:
                                          loginController.visiblityPassword,
                                      keybordType:
                                          TextInputType.visiblePassword,
                                      borderColor: loginController.useColor,
                                      labelText: 'Senha',
                                    );
                                  },
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                child: GradientTextWidget(
                                  'Criar conta',
                                  Colors.black,
                                  Colors.black54,
                                  textAlign: TextAlign.center,
                                  paddignTop: 16,
                                  paddignRight: 16,
                                ),
                                onTap: (){
                                  Modular.to.pushNamed('/LoginPage');
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.0, top: 16),
                          child: BtnPlataform(
                              textColor: ColorsApp.textColor,
                              backgroundColor: loginController.useColor,
                              title:'Entrar',
                              onPressed: () async {
                                loginController.userName =
                                    controllerUserName.text;
                                loginController
                                    .setPassword(controllerPassowrd.text);
                                loginController.loginAcount(context);
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
