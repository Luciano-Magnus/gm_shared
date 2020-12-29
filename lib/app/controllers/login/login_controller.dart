import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gm_shared/app/app_controller.dart';
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

abstract class _LoginController with Store {
  final appController = Modular.get<AppController>();

  bool signIn = true;
  bool signUp = false;

  String titleAndPlatform = '';

  String signInOrSignUp = '';

  Color useColor = ColorsApp.primaryColor;

  String userName = '';

  @observable
  String passowrd = '';

  @observable
  bool visiblityPassword = false;

  @observable
  Users user = Users();

  @action
  void setVisiblityPassword(bool visiblity) => visiblityPassword = visiblity;

  @action
  void setPassword(String value) => passowrd = value;

  @action
  Future createAcount(BuildContext context) async {
    appController.load(context, useColor);

    String hash =
        Password.hash(passowrd, PBKDF2(iterationCount: 500, blockLength: 32));

    user.idUser = '';
    user.nameUser = userName;
    user.passwordUser = hash;
    user.platformUser = titleAndPlatform;

    print(user.nameUser);

    var response = await http.post(ApiUrl.urlPost, body: user.toJson());

    if (response.statusCode == 200) {
      Modular.to.pop();
      showDialog(
        context: context,
        builder: (context) => SucessDialog(
          height: 90,
          content: Text(
            'Sua conta foi criada com sucesso',
            style: GoogleFonts.righteous(),
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
    } else {
      if (response.statusCode == 123) {
        Modular.to.pop();
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
      } else {
        Modular.to.pop();
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
                  child: Text('Houve um erro!\nPor favor tente mais tarde!'),
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

  @action
  Future loginAcount(BuildContext context) async {
    appController.load(context, useColor);

    user.nameUser = userName;
    user.passwordUser = '';
    user.platformUser = '';

    bool checkUser = false;

    try{
       checkUser = await response();
    }catch(e){
      Modular.to.pop();
      showDialog(
        context: context,
        builder: (context) => ErrorDialog(
          content: Text(e.toString()),
        ),
      );
    }

    if (checkUser) {
     Modular.to.pushReplacementNamed('/HomePage');
    } else {
      showDialog(
        context: context,
        builder: (context) => ErrorDialog(
          content: Text('Usuário não existe ou a senha está incorreta!'),
        ),
      );
    }
    print(user.platformUser);
  }

  Future<bool> response() async {
    var dioResponse = await Dio().get('${ApiUrl.urlGetLogin}/$userName');

    int i = dioResponse.data.toString().length - 266;

    String response = dioResponse.data.toString().substring(0, i);

    LoginModel login = LoginModel();

    try {
      login = LoginModel.fromJson(jsonDecode(response));
    } catch (e) {
      print('ue');
      Modular.to.pop();
      throw Exception('Usuário não existe!');
    }

    Modular.to.pop();

    if (login.users.length > 0) {
      if (Password.verify(
          passowrd ?? '0', login.users?.first?.passwordUser ?? '1')) {
        user = login.users.first;
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
