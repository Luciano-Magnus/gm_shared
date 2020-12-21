import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gm_shared/app/pages/login_user_page.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';
import 'package:gm_shared/shared/components/btn_plataform.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginUserPage(
                            'Computador',
                            useColor: ColorsApp.pcColor,),
                        ),
                      );
                    },
                  ),
                  BtnPlataform(
                    title: 'X box',
                    backgroundColor: ColorsApp.xboxColor,
                    textColor: ColorsApp.textColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginUserPage(
                            'X box',
                            useColor: ColorsApp.xboxColor,),
                        ),
                      );
                    },
                  ),
                  BtnPlataform(
                    title: 'Playstation',
                    backgroundColor: ColorsApp.psColor,
                    textColor: ColorsApp.textColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginUserPage(
                            'Playstation',
                            useColor: ColorsApp.psColor,),
                        ),
                      );
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
