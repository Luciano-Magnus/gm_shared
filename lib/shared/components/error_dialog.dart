import 'package:flutter/material.dart';

class ErrorDialog extends StatefulWidget {
  final String title;
  final Color borderColor;
  final Widget content;
  final List<Widget> actions;
  final double height;

  const ErrorDialog(
      {Key key,
      this.title,
      this.borderColor,
      this.content,
      this.actions,
      this.height})
      : super(key: key);

  @override
  _ErrorDialogState createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(widget.title ?? 'Ops!'),
        content: Container(
          height: widget.height ?? 100,
          child: widget.content,
        ),
        actions: widget.actions ?? [],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          side: BorderSide(width: 2, color: widget.borderColor ?? Colors.white),
        ));
  }
}
