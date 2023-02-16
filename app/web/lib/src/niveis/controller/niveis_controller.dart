import 'package:mobx/mobx.dart';
import 'package:web/src/niveis/models/nivel_model.dart';
import 'package:web/src/niveis/repositories/repository_nivel.dart';
part 'niveis_controller.g.dart';

class NiveisController = _NiveisControllerBase with _$NiveisController;

abstract class _NiveisControllerBase with Store {
  late NivelRepository repository;

  _NiveisControllerBase() {
    repository = NivelRepository();
  }

  @observable
  List<NiveisModel> niveis = [];

  @action
  getNiveis() async {
    niveis = await repository.getNiveis();
  }

  @observable
  String postResponse = "";

  @action
  postData(String nivel) async {
    var response = await repository.postData(nivel);

    if (response == "201") {
      postResponse = "Inserido com sucesso";
    } else {
      postResponse = "Nível já existe";
    }
    getNiveis();
  }

  @observable
  String updateResponse = "";

  @observable
  updateData(NiveisModel niveisModel) async {
    int? statusCode = await repository.updateData(
        niveisModel.id!.toString(), niveisModel.nivel!);
    if (statusCode == 200) {
      updateResponse = "Editado com sucesso";
    }
    if (statusCode == 400) {
      updateResponse = "Erro ao editar";
    }
    getNiveis();
  }

  @observable
  String deleteResponse = "";

  @action
  deleteData(String idNivel) async {
    int? response = await repository.deleteData(idNivel);
    if (response == 204) {
      getNiveis();
      deleteResponse = "Deletado com sucesso";
    }
    if (response == 501) {
      deleteResponse = "Nível associado a um ou mais desenvolvedores";
    }
    if (response == 400) {
      deleteResponse = "Erro ao deletar";
    }
  }

  @observable
  int idNivel = 0;

  @action
  Future<int> getNivelIdByName(String nomeNivel) async {
    var response = await repository.getIdNivelByName(nomeNivel);
    return response.id!;
  }
}
