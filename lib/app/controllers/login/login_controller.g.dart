// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  final _$passowrdAtom = Atom(name: '_LoginController.passowrd');

  @override
  String get passowrd {
    _$passowrdAtom.reportRead();
    return super.passowrd;
  }

  @override
  set passowrd(String value) {
    _$passowrdAtom.reportWrite(value, super.passowrd, () {
      super.passowrd = value;
    });
  }

  final _$visiblityPasswordAtom =
      Atom(name: '_LoginController.visiblityPassword');

  @override
  bool get visiblityPassword {
    _$visiblityPasswordAtom.reportRead();
    return super.visiblityPassword;
  }

  @override
  set visiblityPassword(bool value) {
    _$visiblityPasswordAtom.reportWrite(value, super.visiblityPassword, () {
      super.visiblityPassword = value;
    });
  }

  final _$createAcountAsyncAction =
      AsyncAction('_LoginController.createAcount');

  @override
  Future<dynamic> createAcount(BuildContext context) {
    return _$createAcountAsyncAction.run(() => super.createAcount(context));
  }

  final _$_LoginControllerActionController =
      ActionController(name: '_LoginController');

  @override
  void setVisiblityPassword(bool visiblity) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setVisiblityPassword');
    try {
      return super.setVisiblityPassword(visiblity);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passowrd: ${passowrd},
visiblityPassword: ${visiblityPassword}
    ''';
  }
}