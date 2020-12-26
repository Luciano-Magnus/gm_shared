import 'package:flutter/material.dart';

class LoadDialog extends StatefulWidget {
  final List<Widget> actions;
  final Widget content;
  final Color borderColor;
  final double height;

  const LoadDialog(
      {Key key,
      this.actions,
      this.content,
      this.borderColor,
      this.height,})
      : super(key: key);

  @override
  _LoadDialogState createState() => _LoadDialogState();
}

class _LoadDialogState extends State<LoadDialog> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: widget.height == null ? 250 : widget.height,
        child: widget.content,
      ),
      actions: widget.actions ?? null,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          side: BorderSide(width: 2, color: widget.borderColor)),
    );
  }
}
