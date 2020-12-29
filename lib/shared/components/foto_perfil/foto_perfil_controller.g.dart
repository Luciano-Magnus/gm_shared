// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foto_perfil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FotoPerfilController on _FotoPerfilController, Store {
  final _$fotoAtom = Atom(name: '_FotoPerfilController.foto');

  @override
  Uint8List get foto {
    _$fotoAtom.reportRead();
    return super.foto;
  }

  @override
  set foto(Uint8List value) {
    _$fotoAtom.reportWrite(value, super.foto, () {
      super.foto = value;
    });
  }

  final _$_FotoPerfilControllerActionController =
      ActionController(name: '_FotoPerfilController');

  @override
  void setFoto(Uint8List value) {
    final _$actionInfo = _$_FotoPerfilControllerActionController.startAction(
        name: '_FotoPerfilController.setFoto');
    try {
      return super.setFoto(value);
    } finally {
      _$_FotoPerfilControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
foto: ${foto}
    ''';
  }
}
