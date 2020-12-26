import 'package:flutter/material.dart';
import 'package:gm_shared/app/utils/styles/style_app.dart';

class DefaultDialog extends StatefulWidget {
  final String title;
  final Color borderColor;
  final Widget content;
  final List<Widget> actions;
  final double height;

  const DefaultDialog({
    Key key,
    this.title,
    this.borderColor,
    this.content,
    this.actions,
    this.height,
  }) : super(key: key);

  @override
  _DefaultDialogState createState() => _DefaultDialogState();
}

class _DefaultDialogState extends State<DefaultDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title ?? '', style: StyleApp.styleActions),
      content: Container(
        height: widget.height ?? 100,
        child: widget.content,
      ),
      actions: widget.actions ?? [],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        side: BorderSide(width: 2, color: widget.borderColor),
      ),
    );
  }
}
