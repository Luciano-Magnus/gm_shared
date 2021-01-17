import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/controllers/login/login_controller.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';
import 'package:gm_shared/shared/components/btn_plataform.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = Modular.get<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsApp.primaryColor,
        child: Center(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BtnPlataform(
                    title: 'Computador',
                    backgroundColor: ColorsApp.pcColor,
                    textColor: ColorsApp.textColor,
                    onPressed: () {
                      loginController.titleAndPlatform = 'Computador';
                      loginController.useColor = ColorsApp.pcColor;
                      Modular.to.pushNamed('/PerfilPage');
                    },
                  ),
                  BtnPlataform(
                    title: 'X box',
                    backgroundColor: ColorsApp.xboxColor,
                    textColor: ColorsApp.textColor,
                    onPressed: () {
                      loginController.titleAndPlatform = 'X box';
                      loginController.useColor = ColorsApp.xboxColor;
                      Modular.to.pushNamed('/PerfilPage');
                    },
                  ),
                  BtnPlataform(
                    title: 'Playstation',
                    backgroundColor: ColorsApp.psColor,
                    textColor: ColorsApp.textColor,
                    onPressed: () {
                      loginController.titleAndPlatform = 'Playstation';
                      loginController.useColor = ColorsApp.psColor;
                      Modular.to.pushNamed('/PerfilPage');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
