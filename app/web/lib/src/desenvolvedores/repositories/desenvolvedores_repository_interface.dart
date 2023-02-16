import 'package:web/src/desenvolvedores/models/desenvolvedores_model.dart';
import 'package:web/src/niveis/models/nivel_model.dart';

abstract class IDesenvolvedoresRepository {
  Future<List<DesenvolvedoresModel>> getData();
  Future<String> postData(DesenvolvedoresModel desenvolvedoresModel);
  Future<int?> updateData(DesenvolvedoresModel desenvolvedoresModel);
  Future<int?> deleteData(String nivelId);
}
