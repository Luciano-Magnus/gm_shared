import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gm_shared/app/models/login/login_model.dart';
import 'package:gm_shared/app/utils/api/api_url.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';
import 'package:gm_shared/app/utils/styles/style_app.dart';
import 'package:gm_shared/shared/components/error_dialog.dart';
import 'package:gm_shared/shared/components/load_dialog.dart';
import 'package:gm_shared/shared/components/sucess_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:password/password.dart';
import 'package:http/http.dart' as http;


part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store{


  String titleAndPlatform = '';

  Color useColor;

  String userName = '';

  @observable
  String passowrd= '';

  @observable
  bool visiblityPassword = false;

  @action
  void setVisiblityPassword(bool visiblity) => visiblityPassword = visiblity;

  @action
  void setPassword(String value) => passowrd = value;

  @action
  Future createAcount(BuildContext context) async{
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => LoadDialog(
        height: 100,
        borderColor: useColor,
        content: Center(
          child: SpinKitFadingCircle(
            color: useColor,
            size: 50,
          ),
        ),
      ),
    );
    String hash = Password.hash(
        passowrd, PBKDF2(iterationCount: 500, blockLength: 32));
    Users user = Users();
    user.nameUser = userName;
    user.passwordUser = hash;
    user.platformUser = titleAndPlatform;

    var response = await http.post(ApiUrl.urlPost, body: user.toJson());

    if (response.statusCode == 200) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => SucessDialog(
          height: 90,
          content: Text('Sua conta foi criada com sucesso', style: GoogleFonts.righteous(),),
          actions: [
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('OK', style: StyleApp.styleActions,),
            )
          ],
        ),
      );
    }

    if (response.statusCode == 123) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => ErrorDialog(
          height: 128,
          content: Column(
            children: [
              SvgPicture.asset(
                'assets/images/icon_triste.svg',
                width: 70,
                height: 70,
                color: ColorsApp.primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('Usuário já cadastrado!'),
              )
            ],
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: StyleApp.styleActions,
              ),
            )
          ],
        ),
      );
    }

  }
}