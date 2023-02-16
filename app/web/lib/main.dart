import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:web/src/app_widget.dart';
import 'package:web/src/desenvolvedores/controllers/desenvolvedores_controller.dart';
import 'package:web/src/home/controller/home_controller.dart';
import 'package:web/src/niveis/controller/niveis_controller.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<NiveisController>(NiveisController());
  getIt.registerSingleton<DesenvolvedoresController>(
      DesenvolvedoresController());
  getIt.registerSingleton<HomeController>(HomeController());

  runApp(const AppWidget());
}
