import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';

class SucessDialog extends StatefulWidget {
  final String title;
  final Color borderColor;
  final Widget content;
  final List<Widget> actions;
  final double height;

  const SucessDialog({
    Key key,
    this.title,
    this.borderColor,
    this.content,
    this.actions,
    this.height,
  }) : super(key: key);

  @override
  _SucessDialogState createState() => _SucessDialogState();
}

class _SucessDialogState extends State<SucessDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(widget.title ?? 'Sucesso'),
        content: Container(
          height: widget.height ?? 100,
          child: Column(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: widget.content,
              )
            ],
          ),
        ),
        actions: widget.actions ?? [],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          side: BorderSide(width: 2, color: widget.borderColor ?? Colors.white),
        ));
  }
}
