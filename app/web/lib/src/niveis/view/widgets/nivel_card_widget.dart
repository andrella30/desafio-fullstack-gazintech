import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:web/src/niveis/controller/niveis_controller.dart';
import 'package:web/src/niveis/models/nivel_model.dart';
import 'package:web/src/niveis/view/widgets/button_delete_nivel_widget.dart';
import 'package:web/src/niveis/view/widgets/button_update_nivel.dart';

class NivelCardWidget extends StatelessWidget {
  final NiveisModel niveisModel;
  final BoxConstraints constraints;

  const NivelCardWidget(
      {super.key, required this.constraints, required this.niveisModel});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<NiveisController>();
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      height: constraints.maxHeight * 0.1,
      width: constraints.maxWidth * 0.5,
      child: Padding(
        padding: EdgeInsets.only(
          left: constraints.maxWidth * 0.05,
          right: constraints.maxWidth * 0.05,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.05,
              width: constraints.maxWidth * 0.15,
              child: Center(
                child: Text(
                  niveisModel.nivel!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ButtonUpdateNivel(
              constraints: constraints,
              icon: const Icon(Icons.edit),
              title: "Editar",
              id: niveisModel.id!,
            ),
            ButtonDeleteNivel(
              constraints: constraints,
              icon: const Icon(Icons.delete),
              title: "Deletar",
              id: niveisModel.id.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
