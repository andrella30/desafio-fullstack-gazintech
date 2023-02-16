// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'niveis_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NiveisController on _NiveisControllerBase, Store {
  late final _$niveisAtom =
      Atom(name: '_NiveisControllerBase.niveis', context: context);

  @override
  List<NiveisModel> get niveis {
    _$niveisAtom.reportRead();
    return super.niveis;
  }

  @override
  set niveis(List<NiveisModel> value) {
    _$niveisAtom.reportWrite(value, super.niveis, () {
      super.niveis = value;
    });
  }

  late final _$postResponseAtom =
      Atom(name: '_NiveisControllerBase.postResponse', context: context);

  @override
  String get postResponse {
    _$postResponseAtom.reportRead();
    return super.postResponse;
  }

  @override
  set postResponse(String value) {
    _$postResponseAtom.reportWrite(value, super.postResponse, () {
      super.postResponse = value;
    });
  }

  late final _$updateResponseAtom =
      Atom(name: '_NiveisControllerBase.updateResponse', context: context);

  @override
  String get updateResponse {
    _$updateResponseAtom.reportRead();
    return super.updateResponse;
  }

  @override
  set updateResponse(String value) {
    _$updateResponseAtom.reportWrite(value, super.updateResponse, () {
      super.updateResponse = value;
    });
  }

  late final _$deleteResponseAtom =
      Atom(name: '_NiveisControllerBase.deleteResponse', context: context);

  @override
  String get deleteResponse {
    _$deleteResponseAtom.reportRead();
    return super.deleteResponse;
  }

  @override
  set deleteResponse(String value) {
    _$deleteResponseAtom.reportWrite(value, super.deleteResponse, () {
      super.deleteResponse = value;
    });
  }

  late final _$idNivelAtom =
      Atom(name: '_NiveisControllerBase.idNivel', context: context);

  @override
  int get idNivel {
    _$idNivelAtom.reportRead();
    return super.idNivel;
  }

  @override
  set idNivel(int value) {
    _$idNivelAtom.reportWrite(value, super.idNivel, () {
      super.idNivel = value;
    });
  }

  @override
  ObservableFuture updateData(NiveisModel niveisModel) {
    final _$future = super.updateData(niveisModel);
    return ObservableFuture(_$future, context: context);
  }

  late final _$getNiveisAsyncAction =
      AsyncAction('_NiveisControllerBase.getNiveis', context: context);

  @override
  Future getNiveis() {
    return _$getNiveisAsyncAction.run(() => super.getNiveis());
  }

  late final _$postDataAsyncAction =
      AsyncAction('_NiveisControllerBase.postData', context: context);

  @override
  Future postData(String nivel) {
    return _$postDataAsyncAction.run(() => super.postData(nivel));
  }

  late final _$deleteDataAsyncAction =
      AsyncAction('_NiveisControllerBase.deleteData', context: context);

  @override
  Future deleteData(String idNivel) {
    return _$deleteDataAsyncAction.run(() => super.deleteData(idNivel));
  }

  late final _$getNivelIdByNameAsyncAction =
      AsyncAction('_NiveisControllerBase.getNivelIdByName', context: context);

  @override
  Future<int> getNivelIdByName(String nomeNivel) {
    return _$getNivelIdByNameAsyncAction
        .run(() => super.getNivelIdByName(nomeNivel));
  }

  @override
  String toString() {
    return '''
niveis: ${niveis},
postResponse: ${postResponse},
updateResponse: ${updateResponse},
deleteResponse: ${deleteResponse},
idNivel: ${idNivel}
    ''';
  }
}
