import 'package:web/src/niveis/models/nivel_model.dart';

abstract class INivelRepository {
  Future<List<NiveisModel>> getNiveis();
  Future<String> postData(String nivel);
  Future<int?> updateData(String id, String nivel);
  Future<int?> deleteData(String nivelId);
}
