import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Color borderColor;
  final double width;
  final double heigth;
  final TextInputType keybordType;
  final bool obscureText;
  final String labelText;
  final bool enabled;
  final Widget suffix;

  const TextFormFieldWidget({
    Key key,
    this.controller,
    this.borderColor,
    this.width,
    this.heigth,
    this.keybordType,
    this.obscureText,
    this.labelText,
    this.enabled,
    this.suffix,
  }) : super(key: key);

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: TextFormField(
            obscureText: widget.obscureText ?? false,
            controller: widget.controller,
            keyboardType: widget.keybordType ?? TextInputType.text,
            cursorColor: widget.borderColor,
            decoration: InputDecoration(
              suffix: widget.suffix,
              labelText: widget.labelText,
              labelStyle: TextStyle(color: widget.borderColor),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: widget.borderColor, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: widget.borderColor, width: 2.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}
