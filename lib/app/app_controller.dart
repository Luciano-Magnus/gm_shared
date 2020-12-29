import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gm_shared/shared/components/load_dialog.dart';
import 'package:mobx/mobx.dart';
part 'app_controller.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store{

  void load(BuildContext context, Color useColor){
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
  }
}