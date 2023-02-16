// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desenvolvedores_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DesenvolvedoresController on _DesenvolvedoresControllerBase, Store {
  late final _$desenvolvedoresAtom = Atom(
      name: '_DesenvolvedoresControllerBase.desenvolvedores', context: context);

  @override
  List<DesenvolvedoresModel> get desenvolvedores {
    _$desenvolvedoresAtom.reportRead();
    return super.desenvolvedores;
  }

  @override
  set desenvolvedores(List<DesenvolvedoresModel> value) {
    _$desenvolvedoresAtom.reportWrite(value, super.desenvolvedores, () {
      super.desenvolvedores = value;
    });
  }

  late final _$postResponseAtom = Atom(
      name: '_DesenvolvedoresControllerBase.postResponse', context: context);

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

  late final _$updateResponseAtom = Atom(
      name: '_DesenvolvedoresControllerBase.updateResponse', context: context);

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

  late final _$deleteResponseAtom = Atom(
      name: '_DesenvolvedoresControllerBase.deleteResponse', context: context);

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

  late final _$idByNameAtom =
      Atom(name: '_DesenvolvedoresControllerBase.idByName', context: context);

  @override
  int get idByName {
    _$idByNameAtom.reportRead();
    return super.idByName;
  }

  @override
  set idByName(int value) {
    _$idByNameAtom.reportWrite(value, super.idByName, () {
      super.idByName = value;
    });
  }

  @override
  ObservableFuture updateData(DesenvolvedoresModel desenvolvedoresModel) {
    final _$future = super.updateData(desenvolvedoresModel);
    return ObservableFuture(_$future, context: context);
  }

  late final _$getDesenvolvedoresAsyncAction = AsyncAction(
      '_DesenvolvedoresControllerBase.getDesenvolvedores',
      context: context);

  @override
  Future getDesenvolvedores() {
    return _$getDesenvolvedoresAsyncAction
        .run(() => super.getDesenvolvedores());
  }

  late final _$postDataAsyncAction =
      AsyncAction('_DesenvolvedoresControllerBase.postData', context: context);

  @override
  Future postData(DesenvolvedoresModel desenvolvedoresModel) {
    return _$postDataAsyncAction
        .run(() => super.postData(desenvolvedoresModel));
  }

  late final _$deleteDataAsyncAction = AsyncAction(
      '_DesenvolvedoresControllerBase.deleteData',
      context: context);

  @override
  Future deleteData(String idNivel) {
    return _$deleteDataAsyncAction.run(() => super.deleteData(idNivel));
  }

  late final _$getIdbyNameAsyncAction = AsyncAction(
      '_DesenvolvedoresControllerBase.getIdbyName',
      context: context);

  @override
  Future getIdbyName(String nomeNivel) {
    return _$getIdbyNameAsyncAction.run(() => super.getIdbyName(nomeNivel));
  }

  @override
  String toString() {
    return '''
desenvolvedores: ${desenvolvedores},
postResponse: ${postResponse},
updateResponse: ${updateResponse},
deleteResponse: ${deleteResponse},
idByName: ${idByName}
    ''';
  }
}
