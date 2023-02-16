import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:web/src/niveis/controller/niveis_controller.dart';
import 'package:web/src/niveis/models/nivel_model.dart';

class DialogInputNivel extends StatefulWidget {
  const DialogInputNivel({super.key});

  @override
  State<DialogInputNivel> createState() => _DialogInputNivelState();
}

class _DialogInputNivelState extends State<DialogInputNivel> {
  final GlobalKey<FormState> _form = GlobalKey();
  final controller = GetIt.I.get<NiveisController>();
  final NiveisModel niveisModel = NiveisModel();

  Future showSecond(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Container(
          height: 100.0,
          width: 150.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    controller.postResponse,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                );
              }),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("Cadastrar um novo Nível"),
                content: Form(
                  key: _form,
                  child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        niveisModel.nivel = value;
                        controller.postData(niveisModel.nivel!);
                        controller.getNiveis();
                      });
                    },
                    validator: (value) => _validadeInput(value),
                  ),
                ),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text('Voltar'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Observer(
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: const Text('Salvar'),
                              onPressed: () {
                                setState(() {
                                  if (_form.currentState!.validate()) {
                                    _form.currentState!.save();
                                    Navigator.pop(context);
                                    showSecond(context);
                                  }
                                });
                              },
                            ),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            );
          },
          child: const Icon(Icons.add),
        );
      },
    );
  }
}

_validadeInput(value) {
  if (value.isEmpty) {
    return 'Não é possível inserir texto em branco';
  }

  return null;
}
