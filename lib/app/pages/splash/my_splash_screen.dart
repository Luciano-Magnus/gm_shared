import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gm_shared/app/pages/login/login_user_page.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';
import 'package:gm_shared/app/utils/img/img_app.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: ColorsApp.primaryColor,
      duration: 500,
      animationDuration: Duration(milliseconds: 500),
      splashIconSize: 720,
      splash: Image.asset('${ImgApp.image}logo_app_v1.png'),
      nextScreen: LoginUserPage(),);

  }
}
