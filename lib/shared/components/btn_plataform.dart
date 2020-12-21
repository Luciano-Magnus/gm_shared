import 'package:flutter/material.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';

// MaterialButton(
// onPressed: () {},
// child: Padding(
// padding: const EdgeInsets.only(left: 16, right: 16),
// child: Container(
// decoration: BoxDecoration(color: ColorsApp.xboxColor,borderRadius: BorderRadius.circular(50)),
// // color: ColorsApp.xboxColor,
// width: double.infinity,
// height: 50,
// child: Center(
// child: Text(
// 'X Box',
// textAlign: TextAlign.center,
// style: TextStyle(
// color: ColorsApp.textColor,
// ),
// )),
// ),
// ),
// )
class BtnPlataform extends StatefulWidget {
  final Color backgroundColor;
  final Color textColor;
  final Function onPressed;
  final String title;

  const BtnPlataform(
      {Key key, this.backgroundColor, this.onPressed, this.title, this.textColor})
      : super(key: key);

  @override
  _BtnPlataformState createState() => _BtnPlataformState();
}

class _BtnPlataformState extends State<BtnPlataform> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(50)),
            width: double.infinity,
            height: 50,
            child: Center(
                child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: widget.textColor,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
