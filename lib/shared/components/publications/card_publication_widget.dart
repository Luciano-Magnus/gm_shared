import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gm_shared/app/publications/Model/publications_model.dart';
import 'package:gm_shared/app/utils/img/img_app.dart';
import 'package:gm_shared/shared/extensions/date_time_extension_format.dart';

class CardPublicationWidget extends StatefulWidget {
  final Color borderColor;
  final String description;
  final Publications publication;

  const CardPublicationWidget({Key key, this.borderColor, this.description, this.publication})
      : super(key: key);

  @override
  _CardPublicationWidgetState createState() => _CardPublicationWidgetState();
}

class _CardPublicationWidgetState extends State<CardPublicationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          side: BorderSide(width: 2, color: widget.borderColor),
        ),
        child: Column(
          children: [
            Image.asset('${ImgApp.image}placeholder.png', width: double.infinity,),
            Divider(color: widget.borderColor,),
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
                  IconButton(
                      icon: Icon(FlutterIcons.like_sli), onPressed: null)
                ],
              ),
            ),
            Text(widget.publication.dataHoraCriado.formated, style: TextStyle(color: widget.borderColor),)
          ],
        ),
      ),
    );
  }
}
