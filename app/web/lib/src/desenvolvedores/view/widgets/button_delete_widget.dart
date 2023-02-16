import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_it/get_it.dart';
import 'package:web/src/desenvolvedores/controllers/desenvolvedores_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ButtonDeleteDesenvolvedor extends StatelessWidget {
  final BoxConstraints constraints;
  final String id;

  const ButtonDeleteDesenvolvedor(
      {super.key, required this.constraints, required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<DesenvolvedoresController>();

    Future showSecond(BuildContext context) {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Observer(
            builder: (context) => Text(controller.deleteResponse),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 30),
      child: Container(
          height: constraints.maxHeight * 0.10,
          width: constraints.maxWidth * 0.1,
          child: Observer(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Deletar"),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                    width: constraints.maxHeight * 0.05,
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Deseja realmente deletar?'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Não"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.deleteData(id);
                                    Navigator.pop(context);
                                    showSecond(context);
                                  },
                                  child: const Text("Sim"),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
