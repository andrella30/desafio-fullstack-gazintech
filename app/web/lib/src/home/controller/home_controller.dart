import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  bool btnNivelAcionado = false;

  @observable
  bool btnDesenvAcionado = false;

  @observable
  bool btnHomeAcionado = true;

  @action
  changeNivelBtn() {
    btnDesenvAcionado = false;
    btnNivelAcionado = true;
    btnHomeAcionado = false;
  }

  @action
  changeDesenvBtn() {
    btnDesenvAcionado = true;
    btnNivelAcionado = false;
    btnHomeAcionado = false;
  }

  @action
  changeHomeBtn() {
    btnDesenvAcionado = false;
    btnNivelAcionado = false;
    btnHomeAcionado = true;
  }
}
