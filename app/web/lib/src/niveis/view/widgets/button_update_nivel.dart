import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:web/src/niveis/controller/niveis_controller.dart';

import '../../models/nivel_model.dart';

class ButtonUpdateNivel extends StatelessWidget {
  final String title;
  final Icon icon;
  final BoxConstraints constraints;
  final int id;

  const ButtonUpdateNivel(
      {super.key,
      required this.constraints,
      required this.title,
      required this.icon,
      required this.id});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _form = GlobalKey();

    NiveisModel niveisModel = NiveisModel();
    TextEditingController _textFieldController = TextEditingController();

    final controller = GetIt.I.get<NiveisController>();

    Future showSecond(BuildContext context) {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Observer(
            builder: (context) => Text(controller.updateResponse),
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
              children: [
                Text(title),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                  width: constraints.maxHeight * 0.05,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("Editar Nível"),
                            content: Form(
                              key: _form,
                              child: TextFormField(
                                onSaved: (value) {
                                  niveisModel.id = id;
                                  niveisModel.nivel = value;
                                  controller.updateData(niveisModel);
                                },
                                validator: (value) => _validadeInput(value),
                              ),
                            ),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    child: const Text('Voltar'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: ElevatedButton(
                                      child: const Text('Salvar'),
                                      onPressed: () {
                                        if (_form.currentState!.validate()) {
                                          _form.currentState!.save();
                                          Navigator.pop(context);

                                          showSecond(context);
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      icon: icon,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  _validadeInput(value) {
    if (value.isEmpty) {
      return 'Não é possível inserir texto em branco';
    }

    return null;
  }
}
