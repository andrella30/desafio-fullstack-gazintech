import 'package:dio/dio.dart';
import 'package:web/src/desenvolvedores/models/desenvolvedores_model.dart';
import 'package:web/src/desenvolvedores/repositories/desenvolvedores_repository_interface.dart';
import 'package:web/src/shared/consts.dart';

class DesenvolvedoresRepository implements IDesenvolvedoresRepository {
  final _dio = Dio();

  @override
  Future<List<DesenvolvedoresModel>> getData() async {
    const url = "$BASE_URL/desenvolvedores";
    var response = await _dio.get(url);

    List<dynamic> results = response.data as List;
    List<DesenvolvedoresModel> desenvolvedoresList = [];

    for (var element in results) {
      DesenvolvedoresModel desenvolvedorModel =
          DesenvolvedoresModel.fromJson(element);
      desenvolvedoresList.add(desenvolvedorModel);
    }

    return desenvolvedoresList;
  }

  @override
  Future<String> postData(DesenvolvedoresModel desenvolvedoresModel) async {
    try {
      const url = "$BASE_URL/desenvolvedores";
      _dio.options.headers['content-Type'] = 'application/json';

      var response = await _dio.post(url, data: desenvolvedoresModel);
      return response.statusCode.toString();
    } on DioError catch (e) {
      return e.response!.data.toString();
    }
  }

  @override
  Future<int?> updateData(DesenvolvedoresModel desenvolvedoresModel) async {
    try {
      var url = "$BASE_URL/desenvolvedores/${desenvolvedoresModel.id}";
      _dio.options.headers['content-Type'] = 'application/json';
      desenvolvedoresModel.nivelId = desenvolvedoresModel.nivelId;
      var response = await _dio.put(url, data: desenvolvedoresModel);
      return response.statusCode;
    } on DioError catch (e) {
      return e.response?.statusCode;
    }
  }

  @override
  Future<int?> deleteData(String desenvolvedorId) async {
    try {
      var url = "$BASE_URL/desenvolvedores/$desenvolvedorId";
      var response = await _dio.delete(url);
      return response.statusCode!;
    } on DioError catch (e) {
      return e.response!.statusCode;
    }
  }
}
