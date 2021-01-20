import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardHomePageWidget extends StatefulWidget {
  final List<String> list = [
    'Publicações',
    'Publicar',
    'Perfil',
    'Configurações',
  ];
  final List<IconData> icons = [
    MaterialIcons.send,
    AntDesign.upload,
    Icons.person_outline,
    AntDesign.setting,
  ];
  final Color borderColor;

  CardHomePageWidget({Key key, @required this.borderColor}) : super(key: key);

  @override
  _CardHomePageWidgetState createState() => _CardHomePageWidgetState();
}

class _CardHomePageWidgetState extends State<CardHomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 8),
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            height: 100,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  side: BorderSide(width: 2, color: widget.borderColor)),
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                onTap: (){
                  switch(index){
                    case 0:  Modular.to.pushNamed('PublicationsPage');
                    break;
                    case 3:  Modular.to.pushNamed('PerfilPage');
                    break;
                  }

                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(widget.icons[index]),
                    SizedBox(
                      height: 8,
                    ),
                    Text(widget.list[index]),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
