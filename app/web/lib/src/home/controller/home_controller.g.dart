// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$btnNivelAcionadoAtom =
      Atom(name: '_HomeControllerBase.btnNivelAcionado', context: context);

  @override
  bool get btnNivelAcionado {
    _$btnNivelAcionadoAtom.reportRead();
    return super.btnNivelAcionado;
  }

  @override
  set btnNivelAcionado(bool value) {
    _$btnNivelAcionadoAtom.reportWrite(value, super.btnNivelAcionado, () {
      super.btnNivelAcionado = value;
    });
  }

  late final _$btnDesenvAcionadoAtom =
      Atom(name: '_HomeControllerBase.btnDesenvAcionado', context: context);

  @override
  bool get btnDesenvAcionado {
    _$btnDesenvAcionadoAtom.reportRead();
    return super.btnDesenvAcionado;
  }

  @override
  set btnDesenvAcionado(bool value) {
    _$btnDesenvAcionadoAtom.reportWrite(value, super.btnDesenvAcionado, () {
      super.btnDesenvAcionado = value;
    });
  }

  late final _$btnHomeAcionadoAtom =
      Atom(name: '_HomeControllerBase.btnHomeAcionado', context: context);

  @override
  bool get btnHomeAcionado {
    _$btnHomeAcionadoAtom.reportRead();
    return super.btnHomeAcionado;
  }

  @override
  set btnHomeAcionado(bool value) {
    _$btnHomeAcionadoAtom.reportWrite(value, super.btnHomeAcionado, () {
      super.btnHomeAcionado = value;
    });
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  dynamic changeNivelBtn() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeNivelBtn');
    try {
      return super.changeNivelBtn();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDesenvBtn() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeDesenvBtn');
    try {
      return super.changeDesenvBtn();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeHomeBtn() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeHomeBtn');
    try {
      return super.changeHomeBtn();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
btnNivelAcionado: ${btnNivelAcionado},
btnDesenvAcionado: ${btnDesenvAcionado},
btnHomeAcionado: ${btnHomeAcionado}
    ''';
  }
}
