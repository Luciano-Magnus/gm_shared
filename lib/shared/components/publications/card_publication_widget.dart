import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gm_shared/app/publications/Model/publications_model.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';
import 'package:gm_shared/app/utils/img/img_app.dart';
import 'package:gm_shared/shared/extensions/date_time_extension_format.dart';

class CardPublicationWidget extends StatefulWidget {
  final Color borderColor;
  final String description;
  final Publications publication;

  const CardPublicationWidget(
      {Key key, this.borderColor, this.description, this.publication})
      : super(key: key);

  @override
  _CardPublicationWidgetState createState() => _CardPublicationWidgetState();
}

class _CardPublicationWidgetState extends State<CardPublicationWidget> {
  @override
  Widget build(BuildContext context) {
    widget.publication.isLike = widget.publication.isLike ?? false;
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          side: BorderSide(width: 2, color: widget.borderColor),
        ),
        child: Column(
          children: [
            Image.asset(
              '${ImgApp.image}logo_app_v1.png',
              width: double.infinity,
            ),
            Divider(
              color: widget.borderColor,
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.publication.descriptionPublication,
                      style: TextStyle(color: widget.borderColor),
                    ),
                  ),
                  Observer(
                    builder: (context) => IconButton(
                        icon: Icon(
                          FlutterIcons.like_sli,
                          color: widget.publication?.isLike
                              ? widget.borderColor
                              : ColorsApp.secundaryColor,
                        ),
                        onPressed: () {
                          widget.publication.isLike =
                              !widget.publication.isLike ?? true;
                          setState(() {});
                        }),
                  )
                ],
              ),
            ),
            Text(
              widget.publication.dataHoraCriado.formated,
              style: TextStyle(color: widget.borderColor),
            )
          ],
        ),
      ),
    );
  }
}
