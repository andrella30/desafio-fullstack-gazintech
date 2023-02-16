import 'package:mobx/mobx.dart';
import 'package:web/src/desenvolvedores/models/desenvolvedores_model.dart';
import 'package:web/src/desenvolvedores/repositories/desenvolvedores_repository.dart';
part 'desenvolvedores_controller.g.dart';

class DesenvolvedoresController = _DesenvolvedoresControllerBase
    with _$DesenvolvedoresController;

abstract class _DesenvolvedoresControllerBase with Store {
  late DesenvolvedoresRepository repository;

  _DesenvolvedoresControllerBase() {
    repository = DesenvolvedoresRepository();
  }

  @observable
  List<DesenvolvedoresModel> desenvolvedores = [];

  @action
  getDesenvolvedores() async {
    var aux = [];
    desenvolvedores = await repository.getData();
    aux = desenvolvedores;
  }

  @observable
  String postResponse = "";

  @action
  postData(DesenvolvedoresModel desenvolvedoresModel) async {
    var response = await repository.postData(desenvolvedoresModel);

    if (response == "201") {
      postResponse = "Inserido com sucesso";
    } else {
      postResponse = "Erro ao criar desenvolvedor";
    }
    getDesenvolvedores();
  }

  @observable
  String updateResponse = "";

  @observable
  updateData(DesenvolvedoresModel desenvolvedoresModel) async {
    int? statusCode = await repository.updateData(desenvolvedoresModel);
    if (statusCode == 200) {
      updateResponse = "Editado com sucesso";
    }
    if (statusCode == 400) {
      updateResponse = "Erro ao editar";
    }
    getDesenvolvedores();
  }

  @observable
  String deleteResponse = "";

  @action
  deleteData(String idNivel) async {
    int? response = await repository.deleteData(idNivel);
    if (response == 204) {
      getDesenvolvedores();
      deleteResponse = "Deletado com sucesso";
    }
    if (response == 400) {
      deleteResponse = "Erro ao deletar";
    }
  }

  @observable
  int idByName = 0;

  @action
  getIdbyName(String nomeNivel) async {}
}
