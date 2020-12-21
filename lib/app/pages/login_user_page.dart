import 'package:flutter/material.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';
import 'package:gm_shared/shared/components/btn_plataform.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginUserPage extends StatefulWidget {
  final Color useColor;
  final String title;

  const LoginUserPage(this.title, {Key key, this.useColor}) : super(key: key);

  @override
  _LoginUserPageState createState() => _LoginUserPageState();
}

class _LoginUserPageState extends State<LoginUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: GoogleFonts.acme(
            color: widget.useColor,
            fontSize: 24,
          ),
        ),
        backgroundColor: ColorsApp.primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: widget.useColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: ColorsApp.primaryColor,
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
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Nome de usuário',
                    style: TextStyle(color: widget.useColor),
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        height: 60,
                        padding: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: widget.useColor, width: 2),
                            color: ColorsApp.primaryColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: TextFormField(
                          cursorColor: widget.useColor,
                          style: TextStyle(color: widget.useColor),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Senha',
                    style: TextStyle(color: widget.useColor),
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        height: 60,
                        padding: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: widget.useColor, width: 2),
                            color: ColorsApp.primaryColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: widget.useColor,
                          style: TextStyle(color: ColorsApp.textColor),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 150.0),
              child: BtnPlataform(
                textColor: ColorsApp.textColor,
                backgroundColor: widget.useColor,
                title: 'Salvar',
                onPressed: () {
                  print('salvo');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
