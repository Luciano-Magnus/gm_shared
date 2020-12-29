import 'dart:typed_data';
import 'package:file/file.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'foto_perfil_controller.g.dart';

class FotoPerfilController = _FotoPerfilController with _$FotoPerfilController;

abstract class _FotoPerfilController with Store {


  @observable
  Uint8List foto;

  Function(Uint8List foto) onFotoChanged;

  _FotoPerfilController({this.foto, this.onFotoChanged});

  @action
  void setFoto(Uint8List value) {
    foto = value;
  }

}