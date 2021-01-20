import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gm_shared/app/controllers/login/login_controller.dart';
import 'package:gm_shared/app/utils/img/img_app.dart';

class FotoPerfilWidget extends StatelessWidget {
  final MainAxisAlignment alignment;
  final double height;
  final double width;
  final double borderCircular;

  FotoPerfilWidget({
    Key key,
    this.alignment,
    this.height,
    this.width,
    this.borderCircular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Modular.get<LoginController>();
    return Observer(
      builder: (_) {
        return Row(
          mainAxisAlignment: alignment ?? MainAxisAlignment.center,
          children: [
            Container(
              width: width ?? 128,
              height: height ?? 128,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderCircular ?? 64),
                border: Border(
                  top: BorderSide(color: controller.useColor),
                  left: BorderSide(color: controller.useColor),
                  right: BorderSide(color: controller.useColor),
                  bottom: BorderSide(color: controller.useColor),
                ),

              ),
              child: controller.photo != null
                  ? Image.file(controller.photo)
                  : Image.asset(
                      '${ImgApp.image}placeholder.png',
                    ),
            ),
          ],
        );
      },
    );
  }
}
