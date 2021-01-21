// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publications_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PublicationsController on _PublicationsController, Store {
  final _$publicationsAtom = Atom(name: '_PublicationsController.publications');

  @override
  List<Publications> get publications {
    _$publicationsAtom.reportRead();
    return super.publications;
  }

  @override
  set publications(List<Publications> value) {
    _$publicationsAtom.reportWrite(value, super.publications, () {
      super.publications = value;
    });
  }

  final _$isPrimaryPageAtom =
      Atom(name: '_PublicationsController.isPrimaryPage');

  @override
  bool get isPrimaryPage {
    _$isPrimaryPageAtom.reportRead();
    return super.isPrimaryPage;
  }

  @override
  set isPrimaryPage(bool value) {
    _$isPrimaryPageAtom.reportWrite(value, super.isPrimaryPage, () {
      super.isPrimaryPage = value;
    });
  }

  final _$getPublicationsAsyncAction =
      AsyncAction('_PublicationsController.getPublications');

  @override
  Future<void> getPublications() {
    return _$getPublicationsAsyncAction.run(() => super.getPublications());
  }

  @override
  String toString() {
    return '''
publications: ${publications},
isPrimaryPage: ${isPrimaryPage}
    ''';
  }
}
