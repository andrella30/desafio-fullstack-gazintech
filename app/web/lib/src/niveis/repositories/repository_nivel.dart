import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:web/src/niveis/models/nivel_model.dart';
import 'package:web/src/niveis/repositories/repository_nivel_interface.dart';
import 'package:web/src/shared/consts.dart';

class NivelRepository implements INivelRepository {
  final _dio = Dio();

  @override
  Future<List<NiveisModel>> getNiveis() async {
    const url = "$BASE_URL/niveis";
    var response = await _dio.get(url);

    List<dynamic> results = response.data as List;
    List<NiveisModel> niveisList = [];

    for (var element in results) {
      NiveisModel nivelModel = NiveisModel.fromJson(element);
      niveisList.add(nivelModel);
    }

    return niveisList;
  }

  @override
  Future<String> postData(String nivel) async {
    try {
      const url = "$BASE_URL/niveis";
      _dio.options.headers['content-Type'] = 'application/json';

      var response = await _dio.post(url, data: {"nivel": nivel});
      return response.statusCode.toString();
    } on DioError catch (e) {
      return e.response!.data.toString();
    }
  }

  @override
  Future<int?> deleteData(String idNivel) async {
    try {
      var url = "$BASE_URL/niveis/$idNivel";
      var response = await _dio.delete(url);
      return response.statusCode!;
    } on DioError catch (e) {
      return e.response!.statusCode;
    }
  }

  @override
  Future<int?> updateData(String id, String nivel) async {
    try {
      var url = "$BASE_URL/niveis/$id";
      _dio.options.headers['content-Type'] = 'application/json';
      var response = await _dio.put(url, data: {"nivel": nivel});
      return response.statusCode;
    } on DioError catch (e) {
      return e.response?.statusCode;
    }
  }

  Future<NiveisModel> getIdNivelByName(String nivelName) async {
    try {
      var url = "$BASE_URL/niveis/nome/$nivelName";
      _dio.options.headers['content-Type'] = 'application/json';

      var response = await _dio.get(
        url,
      );

      NiveisModel nivelModel = NiveisModel.fromJson(response.data);

      return nivelModel;
    } on DioError catch (e) {
      return e.response?.data;
    }
  }
}
