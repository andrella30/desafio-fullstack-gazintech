import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:web/src/desenvolvedores/controllers/desenvolvedores_controller.dart';
import 'package:web/src/desenvolvedores/models/desenvolvedores_model.dart';
import 'package:web/src/desenvolvedores/view/widgets/button_delete_widget.dart';
import 'package:web/src/desenvolvedores/view/widgets/button_update_desenvolvedores.dart';
import 'package:web/src/desenvolvedores/view/widgets/info_text_widget.dart';
import 'package:web/src/desenvolvedores/view/widgets/layout_desenv_info.dart';

class DevelopersCardWidget extends StatelessWidget {
  final DesenvolvedoresModel developersModel;
  final BoxConstraints constraints;

  const DevelopersCardWidget(
      {super.key, required this.developersModel, required this.constraints});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<DesenvolvedoresController>();

    return Container(
      decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: constraints.maxHeight * 0.2,
      width: constraints.maxWidth * 0.5,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.15,
              width: constraints.maxWidth * 0.20,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * 0.03,
                          width: constraints.maxWidth * 0.15,
                          child: Row(
                            children: [
                              Text(
                                developersModel.nome!,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SizedBox(
                            height: constraints.maxHeight * 0.03,
                            width: constraints.maxWidth * 0.15,
                            child: Row(
                              children: [
                                Text(
                                  developersModel.sexo == "M"
                                      ? "MASCULINO"
                                      : "FEMININO",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.10,
              width: constraints.maxWidth * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Icon(Icons.calendar_month_outlined),
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20, right: 10),
                        child: Text(
                          "Data",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white54),
                        ),
                      ),
                      const Text(
                        "Nascimento",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white54),
                      ),
                      Text(
                        developersModel.dataNascimento!.substring(0, 10),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 30),
                    child: Column(
                      children: [
                        const Text(
                          "Idade",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white54),
                        ),
                        Text(
                          "${developersModel.idade} Anos",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 30),
                    child: Column(
                      children: [
                        const Text(
                          "Hobby",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white54),
                        ),
                        Text(
                          developersModel.hobby!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 30),
                    child: Column(
                      children: [
                        const Text(
                          "Nível",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white54),
                        ),
                        Text(
                          developersModel.nivel!.nivel.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ButtonUpdateDesenvolvedores(
              title: developersModel.id.toString(),
              constraints: constraints,
              desenvolvedoresModel: developersModel,
            ),
            ButtonDeleteDesenvolvedor(
              constraints: constraints,
              id: developersModel.id.toString(),
            )
          ],
        ),
      ),
    );
  }
}
