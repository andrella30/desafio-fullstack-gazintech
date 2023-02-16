import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_it/get_it.dart';
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
          borderRadius: BorderRadius.all(Radius.circular(20))),
      height: constraints.maxHeight * 0.2,
      width: constraints.maxWidth * 0.5,
      child: Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: constraints.maxWidth * 0.05,
          right: constraints.maxWidth * 0.05,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      LayoutDesenvInfo(
                          tipo: "Nome", title: developersModel.nome!),
                      LayoutDesenvInfo(
                          tipo: "Idade",
                          title: developersModel.idade.toString()),
                      LayoutDesenvInfo(
                          tipo: "Sexo", title: developersModel.sexo!),
                    ],
                  ),
                  Row(
                    children: [
                      LayoutDesenvInfo(
                          tipo: "Hobby", title: developersModel.hobby!),
                      LayoutDesenvInfo(
                          tipo: "Data Nascimento",
                          title:
                              developersModel.dataNascimento!.substring(0, 10)),
                    ],
                  ),
                  Row(
                    children: [
                      LayoutDesenvInfo(
                          tipo: "Nível",
                          title: developersModel.nivel!.nivel.toString()),
                    ],
                  ),
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
