import 'package:flutter/material.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';
import 'package:google_fonts/google_fonts.dart';

class CardReputacaoWidget extends StatefulWidget {
  final Color borderColor;
  final int score;

  const CardReputacaoWidget(
      {Key key, @required this.borderColor, @required this.score})
      : super(key: key);

  @override
  _CardReputacaoWidgetState createState() => _CardReputacaoWidgetState();
}

class _CardReputacaoWidgetState extends State<CardReputacaoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        height: 128,
        width: double.infinity,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              side: BorderSide(width: 2, color: widget.borderColor)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Sua reputação',
                  style: GoogleFonts.viga(
                      color: ColorsApp.secundaryColor, fontSize: 16),
                ),
              ),
              Flexible(
                child: _listStars(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _listStars() {
    return Container(
      height: 50,
      width: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
              height: 50,
              width: 50,
              child: Icon(widget.score > index ? Icons.star : Icons.star_border, color: Colors.yellow));
        },
      ),
    );
  }
}
