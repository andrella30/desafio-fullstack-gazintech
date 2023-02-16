import 'package:web/src/niveis/models/nivel_model.dart';

class DesenvolvedoresModel {
  int? id;
  String? nome;
  String? sexo;
  String? dataNascimento;
  int? idade;
  String? hobby;
  NiveisModel? nivel;
  int? nivelId;

  DesenvolvedoresModel(
      {this.id,
      this.nome,
      this.sexo,
      this.dataNascimento,
      this.idade,
      this.hobby,
      this.nivel,
      this.nivelId});

  DesenvolvedoresModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    sexo = json['sexo'];
    dataNascimento = json['dataNascimento'];
    idade = json['idade'];
    hobby = json['hobby'];
    nivel = NiveisModel.fromJson(json['nivel']);
    nivelId = json['nivelId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['sexo'] = this.sexo;
    data['dataNascimento'] = this.dataNascimento;
    data['idade'] = this.idade;
    data['hobby'] = this.hobby;
    data['nivel'] = this.nivel;
    data['nivelId'] = this.nivelId;
    return data;
  }
}
